#include <GUIConstantsEx.au3>
#include <ListViewConstants.au3>

Global $g_iCurCol = -1
Global $g_iSortDir = 1
Global $g_bSet = 0
Global $g_iCol = -1

;Sortierung mit selbsterzeugten Items per DllCall

Example()

Func Example()
	$g_iCurCol = -1
	$g_iSortDir = 1
	$g_bSet = 0
	$g_iCol = -1

	Local $hGUI = GUICreate("Test", 300, 200)

	Local $idLv = GUICtrlCreateListView("Spalte1|Spalte2|Spalte3", 10, 10, 280, 180)
	GUICtrlRegisterListViewSort(-1, "LVSort") ; Registriere die Funktion "SortLV" für das Sortier-Callback

	MyGUICtrlCreateListViewItem("ABC|666|10.05.2004", $idLv, -1)
	MyGUICtrlCreateListViewItem("DEF|444|11.05.2005", $idLv, -1)
	MyGUICtrlCreateListViewItem("CDE|444|12.05.2004", $idLv, -1)

	GUISetState(@SW_SHOW)

	Local $idMsg
	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	While 1
		$idMsg = GUIGetMsg()
		Switch $idMsg
			Case $GUI_EVENT_CLOSE
				ExitLoop

			Case $idLv
				$g_bSet = 0
				$g_iCurCol = $g_iCol
				GUICtrlSendMsg($idLv, $LVM_SETSELECTEDCOLUMN, GUICtrlGetState($idLv), 0)
				DllCall("user32.dll", "int", "InvalidateRect", "hwnd", ControlGetHandle($hGUI, "", $idLv), "int", 0, "int", 1)
		EndSwitch
	WEnd
EndFunc   ;==>Example

; Unsere Sortier-Callback-Funktionen
Func LVSort2($hWnd, $nItem1, $nItem2, $g_iColumn)
	Local $sVal1, $sVal2, $iResult

	; Wechselt die Sortierrichtung
	If $g_iColumn = $g_iCurCol Then
		If Not $g_bSet Then
			$g_iSortDir = $g_iSortDir * -1
			$g_bSet = 1
		EndIf
	Else
		$g_iSortDir = 1
	EndIf
	$g_iCol = $g_iColumn

	$sVal1 = GetSubItemText($hWnd, $nItem1, $g_iColumn)
	$sVal2 = GetSubItemText($hWnd, $nItem2, $g_iColumn)

	; Wenn es die dritte Spalte ist (startet bei 0), dann vergleiche die Daten
	If $g_iColumn = 2 Then
		$sVal1 = StringRight($sVal1, 4) & StringMid($sVal1, 4, 2) & StringLeft($sVal1, 2)
		$sVal2 = StringRight($sVal2, 4) & StringMid($sVal2, 4, 2) & StringLeft($sVal2, 2)
	EndIf

	$iResult = 0 ; Keine Änderung der Position von item1 und item2

	If $sVal1 < $sVal2 Then
		$iResult = -1 ; Setzt item2 vor item1
	ElseIf $sVal1 > $sVal2 Then
		$iResult = 1 ; Setzt item2 hinter item1
	EndIf

	$iResult = $iResult * $g_iSortDir

	Return $iResult
EndFunc   ;==>LVSort2

; Erzeugt und fügt Items direkt in Treeview ein
Func MyGUICtrlCreateListViewItem($sText, $idCtrl, $iIndex)
	Local $tLvitem = DllStructCreate("uint;int;int;uint;uint;ptr;int;int;int;int;")
	Local $tText = DllStructCreate("char[260]")
	Local $aText = StringSplit($sText, "|")

	If $iIndex = -1 Then $iIndex = GUICtrlSendMsg($idCtrl, $LVM_GETITEMCOUNT, 0, 0)

	DllStructSetData($tText, 1, $aText[1]) ; Speichere Text in die Struktur

	DllStructSetData($tLvitem, 1, BitOR($LVIF_TEXT, $LVIF_PARAM))
	DllStructSetData($tLvitem, 2, $iIndex)
	DllStructSetData($tLvitem, 6, DllStructGetPtr($tText))
	; Setzt den lParam der Struktur zu dem Zeilenindex - einmalig in die Treeview
	DllStructSetData($tLvitem, 9, $iIndex)

	$iIndex = GUICtrlSendMsg($idCtrl, $LVM_INSERTITEMA, 0, DllStructGetPtr($tLvitem))

	If $iIndex > -1 Then
		; Fügt nun den Rest des Spaltentextes ein
		For $i = 2 To $aText[0]
			DllStructSetData($tText, 1, $aText[$i])
			DllStructSetData($tLvitem, 3, $i - 1) ; Speichere den Subitem-Index

			GUICtrlSendMsg($idCtrl, $LVM_SETITEMTEXTA, $iIndex, DllStructGetPtr($tLvitem))
		Next
	EndIf

	; Passe die Spaltenbreite dem Text an
	For $i = 0 To 2
		GUICtrlSendMsg($idCtrl, $LVM_SETCOLUMNWIDTH, $i, -1)
		GUICtrlSendMsg($idCtrl, $LVM_SETCOLUMNWIDTH, $i, -2)
	Next
EndFunc   ;==>MyGUICtrlCreateListViewItem

; Text eines Treeview-Items in einer bestimmten Spalte abrufen
Func GetSubItemText($idCtrl, $idItem, $iColumn)
	Local $stLvfi = DllStructCreate("uint;ptr;int;int[2];int")
	Local $tBuffer, $iIndex, $tLvi, $sItemText

	DllStructSetData($stLvfi, 1, $LVFI_PARAM) ; Finde das Item durch unseren gespeicherten Index
	DllStructSetData($stLvfi, 3, $idItem)

	Local $tBuffer = DllStructCreate("char[260]")

	Local $iIndex = GUICtrlSendMsg($idCtrl, $LVM_FINDITEM, -1, DllStructGetPtr($stLvfi)) ;

	Local $tLvi = DllStructCreate("uint;int;int;uint;uint;ptr;int;int;int;int")

	DllStructSetData($tLvi, 1, $LVIF_TEXT)
	DllStructSetData($tLvi, 2, $iIndex)
	DllStructSetData($tLvi, 3, $iColumn)
	DllStructSetData($tLvi, 6, DllStructGetPtr($tBuffer))
	DllStructSetData($tLvi, 7, 260)

	GUICtrlSendMsg($idCtrl, $LVM_GETITEMA, 0, DllStructGetPtr($tLvi)) ;

	Local $sItemText = DllStructGetData($tBuffer, 1)

	Return $sItemText
EndFunc   ;==>GetSubItemText
