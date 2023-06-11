#include <GUIConstantsEx.au3>
#include <GuiEdit.au3>
#include <MsgBoxConstants.au3>
#include <ScrollBarsConstants.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $idEdit, $sText, $iLen

	; Erstellt eine GUI
	$hGui = GUICreate("Edit: Scrollen", 400, 300)
	$idEdit = GUICtrlCreateEdit("", 2, 2, 394, 268, BitOR($ES_WANTRETURN, $WS_VSCROLL))
	GUISetState(@SW_SHOW)

	; Setzt den Text
	For $i = 1 To 50
		$sText &= $i & @CRLF
	Next
	_GUICtrlEdit_SetText($idEdit, $sText)

	MsgBox($MB_SYSTEMMODAL, "Information", "Scrollt eine Zeile runter")
	_GUICtrlEdit_Scroll($idEdit, $SB_LINEDOWN)

	MsgBox($MB_SYSTEMMODAL, "Information", "Scrollt eine Zeile hoch")
	_GUICtrlEdit_Scroll($idEdit, $SB_LINEUP)

	MsgBox($MB_SYSTEMMODAL, "Information", "Scrollt eine Seite runter")
	_GUICtrlEdit_Scroll($idEdit, $SB_PAGEDOWN)

	MsgBox($MB_SYSTEMMODAL, "Information", "Scrollt eine Seite hoch")
	_GUICtrlEdit_Scroll($idEdit, $SB_PAGEUP)

	$iLen = _GUICtrlEdit_GetTextLen($idEdit)
	_GUICtrlEdit_SetSel($idEdit, $iLen, $iLen)

	MsgBox($MB_SYSTEMMODAL, "Information", "Scrollt den blinkenden Balken in die Ansicht")
	_GUICtrlEdit_Scroll($idEdit, $SB_SCROLLCARET)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
