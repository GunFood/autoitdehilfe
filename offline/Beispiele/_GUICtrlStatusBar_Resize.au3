#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsNotifsConstants.au3>

Example()

Func Example()
	Local $hGui
	Local $aParts[3] = [75, 150, -1]

	; Erstellt eine GUI
	Local $hGui = GUICreate("StatusBar Größenänderung (v" & @AutoItVersion & ")", 450, 320, 100, 100, $WS_OVERLAPPEDWINDOW)

	; Setzt die Abschnitte
	Local $hStatus = _GUICtrlStatusBar_Create($hGUI)
	$g_hStatus = $hStatus

	Local $aParts[3] = [75, 150, -1]
	_GUICtrlStatusBar_SetParts($g_hStatus, $aParts)
	_GUICtrlStatusBar_SetText($g_hStatus, "Part 0")
	_GUICtrlStatusBar_SetText($g_hStatus, "Part 1", 1)
	_GUICtrlStatusBar_SetText($g_hStatus, "Part 2", 2)

	; Erstellt ein Memo Control
	_MemoCreate(2, 8, 444, 259)
	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_SIZE, "WM_SIZE")

	_MemoMsgBoxStatus("", -1, $hGUI) ; Keine weiteren Aktionen, es wird gewartet bis die GUI geschlossen wird.

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Bewirkt, dass sich die Statusbar bei Größenänderung des Fensters mitanpasst
Func WM_SIZE($hWnd, $iMsg, $wParam, $lParam)
	#forceref $hWnd, $iMsg, $wParam, $lParam
	_GUICtrlStatusBar_Resize($g_hStatus)
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_SIZE
