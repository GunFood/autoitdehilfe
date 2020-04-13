#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <GuiListView.au3>
#include <WindowsConstants.au3>

Global $g_hListView

Example()

Func Example()
	Local $hGUI, $hImage
	$hGUI = GUICreate("ListView: Erstellen (UDF)", 400, 300)

	$g_hListView = _GUICtrlListView_Create($hGUI, "", 2, 2, 394, 268)
	_GUICtrlListView_SetExtendedListViewStyle($g_hListView, BitOR($LVS_EX_GRIDLINES, $LVS_EX_FULLROWSELECT, $LVS_EX_SUBITEMIMAGES))
	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; Lädt die Bilder
	$hImage = _GUIImageList_Create()
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($g_hListView, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($g_hListView, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlListView_CreateSolidBitMap($g_hListView, 0x0000FF, 16, 16))
	_GUICtrlListView_SetImageList($g_hListView, $hImage, 1)

	; Fügt die Spalten hinzu
	_GUICtrlListView_InsertColumn($g_hListView, 0, "Spalte 1", 120)
	_GUICtrlListView_InsertColumn($g_hListView, 1, "Spalte 2", 120)
	_GUICtrlListView_InsertColumn($g_hListView, 2, "Spalte 3", 120)

	; Fügt die Items hinzu
	_GUICtrlListView_AddItem($g_hListView, "Zeile 1: Spalte 1", 0)
	_GUICtrlListView_AddSubItem($g_hListView, 0, "Zeile 1: Spalte 2", 1)
	_GUICtrlListView_AddSubItem($g_hListView, 0, "Zeile 1: Spalte 3", 2)
	_GUICtrlListView_AddItem($g_hListView, "Zeile 2: Spalte 1", 1)
	_GUICtrlListView_AddSubItem($g_hListView, 1, "Zeile 2: Spalte 2", 1)
	_GUICtrlListView_AddItem($g_hListView, "Zeile 3: Spalte 1", 2)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $hWndListView, $tInfo
;~ 	Local $tBuffer
	$hWndListView = $g_hListView
	If Not IsHWnd($g_hListView) Then $hWndListView = GUICtrlGetHandle($g_hListView)

	$tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hWndListView
			Switch $iCode
;~ 				Case $LVN_BEGINDRAG ; Eine "Ziehen und Ablegen"-Operation wurde ausgelöst, an der die linke Maustaste beteiligt ist
;~ 					$tInfo = DllStructCreate($tagNMLISTVIEW, $lParam)
;~ 					_DebugPrint("$LVN_BEGINDRAG" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
;~ 							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
;~ 							"-->Code:" & @TAB & $iCode & @CRLF & _
;~ 							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
;~ 							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
;~ 							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
;~ 							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
;~ 							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
;~ 							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
;~ 							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
;~ 							"-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
;~ 					; Kein Rückgabewert
;~ 				Case $LVN_BEGINLABELEDIT ; Beginn der Änderung der Itembezeichnung
;~ 					$tInfo = DllStructCreate($tagNMLVDISPINFO, $lParam)
;~ 					_DebugPrint("$LVN_BEGINLABELEDIT" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
;~ 							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
;~ 							"-->Code:" & @TAB & $iCode & @CRLF & _
;~ 							"-->Mask:" & @TAB & DllStructGetData($tInfo, "Mask") & @CRLF & _
;~ 							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
;~ 							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
;~ 							"-->State:" & @TAB & DllStructGetData($tInfo, "State") & @CRLF & _
;~ 							"-->StateMask:" & @TAB & DllStructGetData($tInfo, "StateMask") & @CRLF & _
;~ 							"-->Image:" & @TAB & DllStructGetData($tInfo, "Image") & @CRLF & _
;~ 							"-->Param:" & @TAB & DllStructGetData($tInfo, "Param") & @CRLF & _
;~ 							"-->Indent:" & @TAB & DllStructGetData($tInfo, "Indent") & @CRLF & _
;~ 							"-->GroupID:" & @TAB & DllStructGetData($tInfo, "GroupID") & @CRLF & _
;~ 							"-->Columns:" & @TAB & DllStructGetData($tInfo, "Columns") & @CRLF & _
;~ 							"-->pColumns:" & @TAB & DllStructGetData($tInfo, "pColumns"))
;~ 					Return False ; Erlaubt dem Benutzer, die Bezeichnung zu ändern
;~ 					;Return True  ; Verbietet dem Benutzer, die Bezeichnung zu ändern
;~ 				Case $LVN_BEGINRDRAG ; Eine "Ziehen und Ablegen"-Operation wurde ausgelöst, an der die rechte Maustaste beteiligt ist
;~ 					$tInfo = DllStructCreate($tagNMLISTVIEW, $lParam)
;~ 					_DebugPrint("$LVN_BEGINRDRAG" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
;~ 							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
;~ 							"-->Code:" & @TAB & $iCode & @CRLF & _
;~ 							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
;~ 							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
;~ 							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
;~ 							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
;~ 							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
;~ 							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
;~ 							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
;~ 							"-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
;~ 					; Kein Rückgabewert
;~ 				Case $LVN_BEGINSCROLL ; Eine Scroll-Operation beginnt (Minimum WinXP)
;~ 					$tInfo = DllStructCreate($tagNMLVSCROLL, $lParam)
;~ 					_DebugPrint("$LVN_BEGINSCROLL" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
;~ 							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
;~ 							"-->Code:" & @TAB & $iCode & @CRLF & _
;~ 							"-->DX:" & @TAB & DllStructGetData($tInfo, "DX") & @CRLF & _
;~ 							"-->DY:" & @TAB & DllStructGetData($tInfo, "DY"))
;~ 					; Kein Rückgabewert
				Case $LVN_COLUMNCLICK ; Eine Spalte wurde angeklickt
					$tInfo = DllStructCreate($tagNMLISTVIEW, $lParam)
					_DebugPrint("$LVN_COLUMNCLICK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
							"-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
					; Kein Rückgabewert
;~ 				Case $LVN_DELETEALLITEMS ; Alle Items des Controls sollen gelöscht werden
;~ 					$tInfo = DllStructCreate($tagNMLISTVIEW, $lParam)
;~ 					_DebugPrint("$LVN_DELETEALLITEMS" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
;~ 							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
;~ 							"-->Code:" & @TAB & $iCode & @CRLF & _
;~ 							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
;~ 							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
;~ 							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
;~ 							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
;~ 							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
;~ 							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
;~ 							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
;~ 							"-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
;~ 					Return True ; Unterdrückt die folgenden $LVN_DELETEITEM-Nachrichten
;~ 					;Return False ; Empfängt die folgenden $LVN_DELETEITEM-Nachrichten
;~ 				Case $LVN_DELETEITEM ; Ein Item soll gelöscht werden
;~ 					$tInfo = DllStructCreate($tagNMLISTVIEW, $lParam)
;~ 					_DebugPrint("$LVN_DELETEITEM" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
;~ 							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
;~ 							"-->Code:" & @TAB & $iCode & @CRLF & _
;~ 							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
;~ 							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
;~ 							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
;~ 							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
;~ 							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
;~ 							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
;~ 							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
;~ 							"-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
;~ 					; Kein Rückgabewert
;~ 				Case $LVN_ENDLABELEDIT ; Ende der Änderung der Bezeichnung eines Items
;~ 					$tInfo = DllStructCreate($tagNMLVDISPINFO, $lParam)
;~ 					$tBuffer = DllStructCreate("char Text[" & DllStructGetData($tInfo, "TextMax") & "]", DllStructGetData($tInfo, "Text"))
;~ 					_DebugPrint("$LVN_ENDLABELEDIT" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
;~ 							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
;~ 							"-->Code:" & @TAB & $iCode & @CRLF & _
;~ 							"-->Mask:" & @TAB & DllStructGetData($tInfo, "Mask") & @CRLF & _
;~ 							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
;~ 							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
;~ 							"-->State:" & @TAB & DllStructGetData($tInfo, "State") & @CRLF & _
;~ 							"-->StateMask:" & @TAB & DllStructGetData($tInfo, "StateMask") & @CRLF & _
;~ 							"-->Text:" & @TAB & DllStructGetData($tBuffer, "Text") & @CRLF & _
;~ 							"-->TextMax:" & @TAB & DllStructGetData($tInfo, "TextMax") & @CRLF & _
;~ 							"-->Image:" & @TAB & DllStructGetData($tInfo, "Image") & @CRLF & _
;~ 							"-->Param:" & @TAB & DllStructGetData($tInfo, "Param") & @CRLF & _
;~ 							"-->Indent:" & @TAB & DllStructGetData($tInfo, "Indent") & @CRLF & _
;~ 							"-->GroupID:" & @TAB & DllStructGetData($tInfo, "GroupID") & @CRLF & _
;~ 							"-->Columns:" & @TAB & DllStructGetData($tInfo, "Columns") & @CRLF & _
;~ 							"-->pColumns:" & @TAB & DllStructGetData($tInfo, "pColumns"))
;~ 					; Wenn das Input-Control nicht leer ist, führt der Rückgabewert True zum Übernehmen des Textes als Itembezeichnung, False verwirft den eingegebenen Text.
;~ 					; Wenn das Input-Control leer ist, wird der Rückgabewert ignoriert
;~ 					Return True
;~ 				Case $LVN_ENDSCROLL ; Eine Scroll-Operation endet (Minimum WinXP)
;~ 					$tInfo = DllStructCreate($tagNMLVSCROLL, $lParam)
;~ 					_DebugPrint("$LVN_ENDSCROLL" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
;~ 							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
;~ 							"-->Code:" & @TAB & $iCode & @CRLF & _
;~ 							"-->DX:" & @TAB & DllStructGetData($tInfo, "DX") & @CRLF & _
;~ 							"-->DY:" & @TAB & DllStructGetData($tInfo, "DY"))
;~ 					; Kein Rückgabewert
;~ 				Case $LVN_GETDISPINFO ; Liefert Informationen, die für die Anzeige oder Sortierung eines ListView-Items benötigt werden
;~ 					$tInfo = DllStructCreate($tagNMLVDISPINFO, $lParam)
;~ 					$tBuffer = DllStructCreate("char Text[" & DllStructGetData($tInfo, "TextMax") & "]", DllStructGetData($tInfo, "Text"))
;~ 					_DebugPrint("$LVN_GETDISPINFO" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
;~ 							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
;~ 							"-->Code:" & @TAB & $iCode & @CRLF & _
;~ 							"-->Mask:" & @TAB & DllStructGetData($tInfo, "Mask") & @CRLF & _
;~ 							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
;~ 							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
;~ 							"-->State:" & @TAB & DllStructGetData($tInfo, "State") & @CRLF & _
;~ 							"-->StateMask:" & @TAB & DllStructGetData($tInfo, "StateMask") & @CRLF & _
;~ 							"-->Text:" & @TAB & DllStructGetData($tBuffer, "Text") & @CRLF & _
;~ 							"-->TextMax:" & @TAB & DllStructGetData($tInfo, "TextMax") & @CRLF & _
;~ 							"-->Image:" & @TAB & DllStructGetData($tInfo, "Image") & @CRLF & _
;~ 							"-->Param:" & @TAB & DllStructGetData($tInfo, "Param") & @CRLF & _
;~ 							"-->Indent:" & @TAB & DllStructGetData($tInfo, "Indent") & @CRLF & _
;~ 							"-->GroupID:" & @TAB & DllStructGetData($tInfo, "GroupID") & @CRLF & _
;~ 							"-->Columns:" & @TAB & DllStructGetData($tInfo, "Columns") & @CRLF & _
;~ 							"-->pColumns:" & @TAB & DllStructGetData($tInfo, "pColumns"))
;~ 					; Kein Rückgabewert
;~ 				Case $LVN_GETINFOTIP ; Wird von einem ListView mit großen Icons gesendet, das den erweiterten Stil $LVS_EX_INFOTIP besitzt
;~ 					$tInfo = DllStructCreate($tagNMLVGETINFOTIP, $lParam)
;~ 					$tBuffer = DllStructCreate("char Text[" & DllStructGetData($tInfo, "TextMax") & "]", DllStructGetData($tInfo, "Text"))
;~ 					_DebugPrint("$LVN_GETINFOTIP" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
;~ 							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
;~ 							"-->Code:" & @TAB & $iCode & @CRLF & _
;~ 							"-->Flags:" & @TAB & DllStructGetData($tInfo, "Flags") & @CRLF & _
;~ 							"-->Text:" & @TAB & DllStructGetData($tBuffer, "Text") & @CRLF & _
;~ 							"-->TextMax:" & @TAB & DllStructGetData($tInfo, "TextMax") & @CRLF & _
;~ 							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
;~ 							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
;~ 							"-->lParam:" & @TAB & DllStructGetData($tInfo, "lParam"))
;~ 					; Kein Rückgabewert
;~ 				Case $LVN_HOTTRACK ; Wird von einem ListView gesendet, wenn der Benutzer die Maus über ein Item bewegt
;~ 					$tInfo = DllStructCreate($tagNMLISTVIEW, $lParam)
;~ 					_DebugPrint("$LVN_HOTTRACK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
;~ 							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
;~ 							"-->Code:" & @TAB & $iCode & @CRLF & _
;~ 							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
;~ 							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
;~ 							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
;~ 							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
;~ 							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
;~ 							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
;~ 							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
;~ 							"-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
;~ 					Return 0 ; Erlaubt dem ListView, seine normale "Verfolgen und Auswählen"-Operation durchzuführen.
;~ 					;Return 1 ; Das Item wird nicht ausgewählt.
;~ 				Case $LVN_INSERTITEM ; Ein neues Item wurde eingefügt
;~ 					$tInfo = DllStructCreate($tagNMLISTVIEW, $lParam)
;~ 					_DebugPrint("$LVN_INSERTITEM" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
;~ 							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
;~ 							"-->Code:" & @TAB & $iCode & @CRLF & _
;~ 							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
;~ 							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
;~ 							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
;~ 							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
;~ 							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
;~ 							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
;~ 							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
;~ 							"-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
;~ 					; Kein Rückgabewert
;~ 				Case $LVN_ITEMACTIVATE ; Wird von einem ListView gesendet, wenn der Benutzer ein Item aktiviert
;~ 					$tInfo = DllStructCreate($tagNMITEMACTIVATE, $lParam)
;~ 					_DebugPrint("$LVN_ITEMACTIVATE" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
;~ 							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
;~ 							"-->Code:" & @TAB & $iCode & @CRLF & _
;~ 							"-->Index:" & @TAB & DllStructGetData($tInfo, "Index") & @CRLF & _
;~ 							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
;~ 							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
;~ 							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
;~ 							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
;~ 							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
;~ 							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
;~ 							"-->lParam:" & @TAB & DllStructGetData($tInfo, "lParam") & @CRLF & _
;~ 							"-->KeyFlags:" & @TAB & DllStructGetData($tInfo, "KeyFlags"))
;~ 					Return 0
;~ 				Case $LVN_ITEMCHANGED ; Ein Item hat sich geändert
;~ 					$tInfo = DllStructCreate($tagNMLISTVIEW, $lParam)
;~ 					_DebugPrint("$LVN_ITEMCHANGED" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
;~ 							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
;~ 							"-->Code:" & @TAB & $iCode & @CRLF & _
;~ 							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
;~ 							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
;~ 							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
;~ 							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
;~ 							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
;~ 							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
;~ 							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
;~ 							"-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
;~ 					; Kein Rückgabewert
;~ 				Case $LVN_ITEMCHANGING ; Ein Item wird geändert
;~ 					$tInfo = DllStructCreate($tagNMLISTVIEW, $lParam)
;~ 					_DebugPrint("$LVN_ITEMCHANGING" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
;~ 							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
;~ 							"-->Code:" & @TAB & $iCode & @CRLF & _
;~ 							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
;~ 							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
;~ 							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
;~ 							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
;~ 							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
;~ 							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
;~ 							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
;~ 							"-->Param:" & @TAB & DllStructGetData($tInfo, "Param"))
;~ 					Return True ; Verhindert das Ändern
;~ 					;Return False ; Erlaubt das Ändern
				Case $LVN_KEYDOWN ; Eine Taste wurde gedrückt
					$tInfo = DllStructCreate($tagNMLVKEYDOWN, $lParam)
					_DebugPrint("$LVN_KEYDOWN" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->VKey:" & @TAB & DllStructGetData($tInfo, "VKey") & @CRLF & _
							"-->Flags:" & @TAB & DllStructGetData($tInfo, "Flags"))
					; Kein Rückgabewert
;~ 				Case $LVN_MARQUEEBEGIN ; Ein Auswahlrahmen (Marquee) wurde begonnen
;~ 					_DebugPrint("$LVN_MARQUEEBEGIN" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
;~ 							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
;~ 							"-->Code:" & @TAB & $iCode)
;~ 					Return 0 ; Akzeptiert die Nachricht
;~ 					;Return 1 ; Bricht die Auswahlbox ab
;~ 				Case $LVN_SETDISPINFO ; Aktualisiert die enthaltenen Informationen über ein Item
;~ 					$tInfo = DllStructCreate($tagNMLVDISPINFO, $lParam)
;~ 					$tBuffer = DllStructCreate("char Text[" & DllStructGetData($tInfo, "TextMax") & "]", DllStructGetData($tInfo, "Text"))
;~ 					_DebugPrint("$LVN_SETDISPINFO" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
;~ 							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
;~ 							"-->Code:" & @TAB & $iCode & @CRLF & _
;~ 							"-->Mask:" & @TAB & DllStructGetData($tInfo, "Mask") & @CRLF & _
;~ 							"-->Item:" & @TAB & DllStructGetData($tInfo, "Item") & @CRLF & _
;~ 							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
;~ 							"-->State:" & @TAB & DllStructGetData($tInfo, "State") & @CRLF & _
;~ 							"-->StateMask:" & @TAB & DllStructGetData($tInfo, "StateMask") & @CRLF & _
;~ 							"-->Text:" & @TAB & DllStructGetData($tBuffer, "Text") & @CRLF & _
;~ 							"-->TextMax:" & @TAB & DllStructGetData($tInfo, "TextMax") & @CRLF & _
;~ 							"-->Image:" & @TAB & DllStructGetData($tInfo, "Image") & @CRLF & _
;~ 							"-->Param:" & @TAB & DllStructGetData($tInfo, "Param") & @CRLF & _
;~ 							"-->Indent:" & @TAB & DllStructGetData($tInfo, "Indent") & @CRLF & _
;~ 							"-->GroupID:" & @TAB & DllStructGetData($tInfo, "GroupID") & @CRLF & _
;~ 							"-->Columns:" & @TAB & DllStructGetData($tInfo, "Columns") & @CRLF & _
;~ 							"-->pColumns:" & @TAB & DllStructGetData($tInfo, "pColumns"))
;~ 					; Kein Rückgabewert
				Case $NM_CLICK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der linken Maustaste anklickt
					$tInfo = DllStructCreate($tagNMITEMACTIVATE, $lParam)
					_DebugPrint("$NM_CLICK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->Index:" & @TAB & DllStructGetData($tInfo, "Index") & @CRLF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
							"-->lParam:" & @TAB & DllStructGetData($tInfo, "lParam") & @CRLF & _
							"-->KeyFlags:" & @TAB & DllStructGetData($tInfo, "KeyFlags"))
					; Kein Rückgabewert
				Case $NM_DBLCLK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der linken Maustaste doppelklickt
					$tInfo = DllStructCreate($tagNMITEMACTIVATE, $lParam)
					_DebugPrint("$NM_DBLCLK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->Index:" & @TAB & DllStructGetData($tInfo, "Index") & @CRLF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
							"-->lParam:" & @TAB & DllStructGetData($tInfo, "lParam") & @CRLF & _
							"-->KeyFlags:" & @TAB & DllStructGetData($tInfo, "KeyFlags"))
					; Kein Rückgabewert
;~ 				Case $NM_HOVER ; Wird vom ListView gesendet, wenn die Maus über einem Item schwebt
;~ 					_DebugPrint("$NM_HOVER" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
;~ 							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
;~ 							"-->Code:" & @TAB & $iCode)
;~ 					Return 0 ; Normale Bearbeitung der Schwebe-Nachricht
;~ 					;Return 1 ; Verbietet die Abarbeitung der Schwebe-Nachricht
				Case $NM_KILLFOCUS ; Das Control hat den Eingabefokus verloren
					_DebugPrint("$NM_KILLFOCUS" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $NM_RCLICK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der rechten Maustaste anklickt
					$tInfo = DllStructCreate($tagNMITEMACTIVATE, $lParam)
					_DebugPrint("$NM_RCLICK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->Index:" & @TAB & DllStructGetData($tInfo, "Index") & @CRLF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
							"-->lParam:" & @TAB & DllStructGetData($tInfo, "lParam") & @CRLF & _
							"-->KeyFlags:" & @TAB & DllStructGetData($tInfo, "KeyFlags"))
					;Return 1 ; Verhindert die weitere Standard-Nachrichtenbehandlung
					Return 0 ; Erlaubt die weitere Standard-Nachrichtenbehandlung
				Case $NM_RDBLCLK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der rechten Maustaste doppelklickt
					$tInfo = DllStructCreate($tagNMITEMACTIVATE, $lParam)
					_DebugPrint("$NM_RDBLCLK" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->Index:" & @TAB & DllStructGetData($tInfo, "Index") & @CRLF & _
							"-->SubItem:" & @TAB & DllStructGetData($tInfo, "SubItem") & @CRLF & _
							"-->NewState:" & @TAB & DllStructGetData($tInfo, "NewState") & @CRLF & _
							"-->OldState:" & @TAB & DllStructGetData($tInfo, "OldState") & @CRLF & _
							"-->Changed:" & @TAB & DllStructGetData($tInfo, "Changed") & @CRLF & _
							"-->ActionX:" & @TAB & DllStructGetData($tInfo, "ActionX") & @CRLF & _
							"-->ActionY:" & @TAB & DllStructGetData($tInfo, "ActionY") & @CRLF & _
							"-->lParam:" & @TAB & DllStructGetData($tInfo, "lParam") & @CRLF & _
							"-->KeyFlags:" & @TAB & DllStructGetData($tInfo, "KeyFlags"))
					; Kein Rückgabewert
				Case $NM_RETURN ; Das Control hat den Eingabefokus und der Benutzer hat die ENTER-Taste gedrückt
					_DebugPrint("$NM_RETURN" & @CRLF & "--> hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
				Case $NM_SETFOCUS ; Das Control hat den Eingabefokus erhalten
					_DebugPrint("$NM_SETFOCUS" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode)
					; Kein Rückgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func _DebugPrint($s_text, $sLine = @ScriptLineNumber)
	ConsoleWrite( _
			"!===========================================================" & @CRLF & _
			"+======================================================" & @CRLF & _
			"-->Zeile(" & StringFormat("%04d", $sLine) & "):" & @TAB & $s_text & @CRLF & _
			"+======================================================" & @CRLF)
EndFunc   ;==>_DebugPrint
