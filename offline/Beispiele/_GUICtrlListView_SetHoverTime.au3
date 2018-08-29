#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiStatusBar.au3>
#include <MsgBoxConstants.au3>
#include <WindowsConstants.au3>

Global $g_idListView, $g_hStatus

Example()

Func Example()
	Local $hGUI
	Local $iStylesEx = BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_TRACKSELECT)

	$hGUI = GUICreate("ListView: Bestimmt wie lange der Mauscursor über einem Item stehen bleiben muss, bevor dieses ausgewählt wird", 800, 300)
	$g_idListView = GUICtrlCreateListView("", 2, 2, 394, 268)
	_GUICtrlListView_SetHoverTime($g_idListView, 1000)
	_GUICtrlListView_SetExtendedListViewStyle($g_idListView, $iStylesEx)
	$g_idListView = GUICtrlGetHandle($g_idListView)
	$g_hStatus = _GUICtrlStatusBar_Create($hGUI, -1, "")
	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($g_idListView, "Spalte 1", 120)
	_GUICtrlListView_AddColumn($g_idListView, "Spalte 2", 120)
	_GUICtrlListView_AddColumn($g_idListView, "Spalte 3", 120)

	_GUICtrlListView_InsertItem($g_idListView, "Zeile 1: Spalte 1")
	_GUICtrlListView_AddSubItem($g_idListView, 0, "Zeile 1: Spalte 2", 1)
	_GUICtrlListView_AddSubItem($g_idListView, 0, "Zeile 1: Spalte 3", 2)
	_GUICtrlListView_InsertItem($g_idListView, "Zeile 2: Spalte 1")
	_GUICtrlListView_AddSubItem($g_idListView, 1, "Zeile 2: Spalte 2", 1)
	_GUICtrlListView_InsertItem($g_idListView, "Zeile 3: Spalte 1")

	; Ermittelt, wie lange der Mauscursor über einem Item stehen bleiben muss, bevor dieses ausgewählt wird
	MsgBox($MB_SYSTEMMODAL, "Information", "Der Mauscursor musste bisher " & _GUICtrlListView_GetHoverTime($g_idListView) & " Millisekunden (HoverTime)" & @CRLF & "über einem Item stehen, bevor dieses ausgewählt wird.")

	; Bestimmt, wie lange der Mauscursor über einem Item stehen bleiben muss, bevor dieses ausgewählt wird
	_GUICtrlListView_SetHoverTime($g_idListView, 500)
	MsgBox($MB_SYSTEMMODAL, "Information", "Jetzt sind es nur noch " & _GUICtrlListView_GetHoverTime($g_idListView) & " Millisekunden!")

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
		EndSwitch
	WEnd
	GUIDelete()
EndFunc   ;==>Example

Func ListView_HOTTRACK($iSubItem)
	Local $iHotItem = _GUICtrlListView_GetHotItem($g_idListView)
	If $iHotItem <> -1 Then _GUICtrlStatusBar_SetText($g_hStatus, "Überfahrenes Item: " & $iHotItem & " SubItem: " & $iSubItem)
EndFunc   ;==>ListView_HOTTRACK

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $hWndFrom, $iIDFrom, $iCode, $tNMHDR, $hWndListView, $tInfo
	$hWndListView = $g_idListView
	If Not IsHWnd($g_idListView) Then $hWndListView = GUICtrlGetHandle($g_idListView)

	$tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iIDFrom = DllStructGetData($tNMHDR, "IDFrom")
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hWndListView
			Switch $iCode
				Case $LVN_COLUMNCLICK ; Es wurde auf eine Spalte geklickt
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
				Case $LVN_DELETEITEM ; Ein Item soll gelöscht werden
					$tInfo = DllStructCreate($tagNMLISTVIEW, $lParam)
					_DebugPrint("$LVN_DELETEITEM" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
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
				Case $LVN_HOTTRACK ; Wird von einem ListView gesendet, wenn der Benutzer die Maus über ein Item bewegt
					$tInfo = DllStructCreate($tagNMLISTVIEW, $lParam)
					ListView_HOTTRACK(DllStructGetData($tInfo, "SubItem"))
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
					Return 0 ; Erlaubt dem ListView, seine normale "Verfolgen und Auswählen"-Operation durchzuführen
					;Return 1 ; Das Item wird nicht ausgewählt
				Case $LVN_KEYDOWN ; Eine Taste wurde gedrückt
					$tInfo = DllStructCreate($tagNMLVKEYDOWN, $lParam)
					_DebugPrint("$LVN_KEYDOWN" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
							"-->IDFrom:" & @TAB & $iIDFrom & @CRLF & _
							"-->Code:" & @TAB & $iCode & @CRLF & _
							"-->VKey:" & @TAB & DllStructGetData($tInfo, "VKey") & @CRLF & _
							"-->Flags:" & @TAB & DllStructGetData($tInfo, "Flags"))
					; Kein Rückgabewert
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
				Case $NM_KILLFOCUS ; Das Control hat den Eingabefokus verloren
					_DebugPrint("$NM_KILLFOCUS" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
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
					_DebugPrint("$NM_RETURN" & @CRLF & "-->hWndFrom:" & @TAB & $hWndFrom & @CRLF & _
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
