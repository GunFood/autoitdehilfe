#include <GuiConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WindowsConstants.au3>

Global $g_hStatus

Example()

Func Example()
	Local $hGui
	Local $aParts[3] = [75, 150, -1]

	; Erstellt eine GUI
	Local $hGui = GUICreate("StatusBar Größenänderung (v" & @AutoItVersion & ")", 400, 300, -1, -1, $WS_OVERLAPPEDWINDOW)

	; Setzt die Abschnitte
	$g_hStatus = _GUICtrlStatusBar_Create($hGui)
	Local $aParts[3] = [75, 150, -1]
	_GUICtrlStatusBar_SetParts($g_hStatus, $aParts)
	_GUICtrlStatusBar_SetText($g_hStatus, "Part 0")
	_GUICtrlStatusBar_SetText($g_hStatus, "Part 1", 1)
	_GUICtrlStatusBar_SetText($g_hStatus, "Part 2", 2)

	GUISetState(@SW_SHOW)

	GUIRegisterMsg($WM_SIZE, "WM_SIZE")

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
