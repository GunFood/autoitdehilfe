#include "Extras\WM_NOTIFY.au3"

#include <GUIConstantsEx.au3>
#include <GuiListView.au3>
#include <GuiStatusBar.au3>
#include <MsgBoxConstants.au3>
#include <StructureConstants.au3>
#include <WindowsNotifsConstants.au3>

Global $g_idListview, $g_hStatus

Example()

Func Example()
	Local $hGUI = GUICreate("ListView: Setzt und ermittelt wie lange der Mauscursor über einem Item stehen bleiben muss, bevor dieses ausgewählt wird (v" & @AutoItVersion & ")", 800, 300)

	$g_idListview = GUICtrlCreateListView("", 2, 2, 394, 268)
	_GUICtrlListView_SetExtendedListViewStyle($g_idListview, BitOR($LVS_EX_FULLROWSELECT, $LVS_EX_GRIDLINES, $LVS_EX_TRACKSELECT))
	$g_hStatus = _GUICtrlStatusBar_Create($hGUI)
	_GUICtrlStatusBar_SetSimple($g_hStatus, True)
	GUISetState(@SW_SHOW)

	; Fügt die Spalten hinzu
	_GUICtrlListView_AddColumn($g_idListview, "Spalte 0", 120)
	_GUICtrlListView_AddColumn($g_idListview, "Spalte 1", 120)
	_GUICtrlListView_AddColumn($g_idListview, "Spalte 2", 120)

	_GUICtrlListView_InsertItem($g_idListview, "Zeile 0: Spalte 0", -1, 0)
	_GUICtrlListView_AddSubItem($g_idListview, 0, "Zeile 0: Spalte 1", 1, 1)
	_GUICtrlListView_AddSubItem($g_idListview, 0, "Zeile 0: Spalte 2", 2, 2)
	_GUICtrlListView_InsertItem($g_idListview, "Zeile 1: Spalte 0", -1, 1)
	_GUICtrlListView_AddSubItem($g_idListview, 1, "Zeile 1: Spalte 1", 1, 2)
	_GUICtrlListView_InsertItem($g_idListview, "Zeile 2: Spalte 0", -1, 2)

	;Registriert WM_NOTIFY-Ereignisse
	_WM_NOTIFY_Register()

	; Ermittelt die Hove-Zeit
	MsgBox($MB_SYSTEMMODAL, "Information", "Vorherige Hover Zeit (Millisekunden): " & _GUICtrlListView_GetHoverTime($g_idListview))

	; Bestimmt, wie lange der Mauscursor über einem Item stehen bleiben muss, bevor dieses ausgewählt wird
	_GUICtrlListView_SetHoverTime($g_idListview, 1234)
	MsgBox($MB_SYSTEMMODAL, "Information", "Der Mauscursor muss " & _GUICtrlListView_GetHoverTime($g_idListview) & " Millisekunden (HoverTime)" & @CRLF & "über einem Item stehen, bevor dieses ausgewählt wird!")

	; Registriert WM_NOTIFY-Ereignisse
	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

Func ListView_HOTTRACK($iSubItem)
	Local $iHotItem = _GUICtrlListView_GetHotItem($g_idListview)
	If $iHotItem <> -1 Then _GUICtrlStatusBar_SetText($g_hStatus, "Überfahrenes Item: " & $iHotItem & " SubItem: " & $iSubItem)
EndFunc   ;==>ListView_HOTTRACK

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $hWndListView = $g_idListview
	If Not IsHWnd($g_idListview) Then $hWndListView = GUICtrlGetHandle($g_idListview)

	Local $tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	Local $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	Local $iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hWndListView
			Switch $iCode
				Case $LVN_COLUMNCLICK ; Es wurde auf eine Spalte geklickt
					_WM_NOTIFY_DebugEvent("$LVN_COLUMNCLICK", $tagNMLISTVIEW, $lParam, "IDFrom,,Item,SubItem,NewState,OldState,Changed,ActionX,ActionY,Param")
					; Kein Rückgabewert
				Case $LVN_DELETEITEM ; Ein Item soll gelöscht werden
					_WM_NOTIFY_DebugEvent("$LVN_DELETEITEM", $tagNMLISTVIEW, $lParam, "IDFrom,,Item,SubItem,NewState,OldState,Changed,ActionX,ActionY,Param")
					; Kein Rückgabewert
				Case $LVN_HOTTRACK ; Wird von einem ListView gesendet, wenn der Benutzer die Maus über ein Item bewegt
					Local $tInfo = DllStructCreate($tagNMLISTVIEW, $lParam)
					ListView_HOTTRACK(DllStructGetData($tInfo, "SubItem"))
;~ 					_WM_NOTIFY_DebugEvent("$LVN_HOTTRACK", $tagNMLISTVIEW, $lParam, "IDFrom,,Item,SubItem,NewState,OldState,Changed,ActionX,ActionY,Param")
					Return 0 ; Erlaubt dem ListView, seine normale "Verfolgen und Auswählen"-Operation durchzuführen
					;Return 1 ; Das Item wird nicht ausgewählt
				Case $LVN_KEYDOWN ; Eine Taste wurde gedrückt
					_WM_NOTIFY_DebugEvent("$LVN_KEYDOWN", $tagNMLVKEYDOWN, $lParam, "IDFrom,,VKey,Flags")
					; Kein Rückgabewert
				Case $NM_CLICK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der linken Maustaste anklickt
					_WM_NOTIFY_DebugEvent("$NM_CLICK", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,X,Y,lParam,KeyFlags")
					; Kein Rückgabewert
				Case $NM_DBLCLK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der linken Maustaste doppelklickt
					_WM_NOTIFY_DebugEvent("$NM_DBLCLK", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,X,Y,lParam,KeyFlags")
					; Kein Rückgabewert
				Case $NM_KILLFOCUS ; Das Control hat den Eingabefokus verloren
					_WM_NOTIFY_DebugEvent("$NM_KILLFOCUS", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Kein Rückgabewert
				Case $NM_RCLICK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der rechten Maustaste anklickt
					_WM_NOTIFY_DebugEvent("$NM_RCLICK", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,X,Y,lParam,KeyFlags")
					;Return 1 ; Verhindert die weitere Standard-Nachrichtenbehandlung
					Return 0 ; Erlaubt die weitere Standard-Nachrichtenbehandlung
				Case $NM_RDBLCLK ; Wird vom ListView gesendet, wenn der Benutzer ein Item mit der rechten Maustaste doppelklickt
					_WM_NOTIFY_DebugEvent("$NM_RDBLCLK", $tagNMITEMACTIVATE, $lParam, "IDFrom,,Index,SubItem,NewState,OldState,Changed,X,Y,lParam,KeyFlags")
					; Kein Rückgabewert
				Case $NM_RETURN ; Das Control hat den Eingabefokus und der Benutzer hat die ENTER-Taste gedrückt
					_WM_NOTIFY_DebugEvent("$NM_RETURN", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Kein Rückgabewert
				Case $NM_SETFOCUS ; Das Control hat den Eingabefokus erhalten
					_WM_NOTIFY_DebugEvent("$NM_SETFOCUS", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Kein Rückgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
