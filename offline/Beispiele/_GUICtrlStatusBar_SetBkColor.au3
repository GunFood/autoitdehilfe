#include <ColorConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WinAPITheme.au3>

Example()

Func Example()
	; Erstellt eine GUI
	Local $hGUI = GUICreate("StatusBar: Setzt die Hintergrundfarbe (v" & @AutoItVersion & ")", 400, 300)
	Local $hStatus = _GUICtrlStatusBar_Create($hGUI)
	GUISetState(@SW_SHOW)

	; um das Ändern der Hintergrundeinstellung zumindest unter Windows 10 zu erlauben
	_WinAPI_SetWindowTheme($hStatus, "", "")

	; Setzt die Abschnitte
	Local $aParts[3] = [75, 150, -1]
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 0")
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 1", 1)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 2", 2)

	; Setzt die Hintergrundfarbe
	_GUICtrlStatusBar_SetBkColor($hStatus, $CLR_DARKSEAGREEN)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
