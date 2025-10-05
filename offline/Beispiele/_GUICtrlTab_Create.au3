; == Beispiel : Erstellt mit der UDF

#include "Extras\HelpFileInternals.au3"
#include "Extras\WM_NOTIFY.au3"

#include <GUIConstantsEx.au3>
#include <GuiTab.au3>
#include <WindowsStylesConstants.au3>

Global $g_hTab

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("Tab-Control: Erstellen (v" & @AutoItVersion & ")", 450, 300, 100, 100)
	$g_hTab = _GUICtrlTab_Create($hGUI, 2, 2, 446, 266)
	_MemoMsgBoxStatus() ; Statuserstellung

	GUISetState(@SW_SHOW)

	_WM_NOTIFY_Register()

	_Memo_MemoMsgBox($MB_SYSTEMMODAL, "Information", "3 Tabs erstellen")
	; Fügt Tabs hinzu
	_GUICtrlTab_InsertItem($g_hTab, 0, "Tab 0")
	_GUICtrlTab_InsertItem($g_hTab, 1, "Tab 1")
	_GUICtrlTab_InsertItem($g_hTab, 2, "Tab 2")

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam
	Local $hWndTab = $g_hTab
	If Not IsHWnd($g_hTab) Then $hWndTab = GUICtrlGetHandle($g_hTab)

	Local $tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	Local $hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	Local $iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $hWndTab
			Switch $iCode
				Case $NM_CLICK ; Der Benutzer hat die linke Maustaste innerhalb des Controls gedrückt
					_WM_NOTIFY_DebugEvent("$NM_CLICK", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Der Rückgabewert wird durch das Tab-Control ignoriert
				Case $NM_DBLCLK ; Der Benutzer einen Doppelklick mit der linken Maustaste innerhalb des Controls durchgeführt
					_WM_NOTIFY_DebugEvent("$NM_DBLCLK", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
;~ 					Gibt 1 zurück ; Nonzero falls nicht Standard
					Return 0 ; 0 falls Standard
				Case $NM_RCLICK ; Der Benutzer hat die rechte Maustaste innerhalb des Controls gedrückt
					_WM_NOTIFY_DebugEvent("$NM_RCLICK", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
;~ 					Gibt 1 zurück ; Nonzero falls nicht Standard
					Return 0 ; 0 falls Standard
				Case $NM_RDBLCLK ; Der Benutzer einen Doppelklick mit der rechten Maustaste innerhalb des Controls durchgeführt
					_WM_NOTIFY_DebugEvent("$NM_RDBLCLK", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
;~ 					Gibt 1 zurück ; Nonzero falls nicht Standard
					Return 0 ; 0 falls Standard
				Case $NM_RELEASEDCAPTURE ; Das Control wurde durch die Maus erfasst
					_WM_NOTIFY_DebugEvent("$NM_RELEASEDCAPTURE", $tagNMHDR, $lParam, "hWndFrom,IDFrom")
					; Kein Rückgabewert
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY
