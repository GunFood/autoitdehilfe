#include <ColorConstants.au3>
#include <GUIConstantsEx.au3>
#include <GuiStatusBar.au3>
#include <WinAPITheme.au3>

Example()

Func Example()
	Local $hGui, $hStatus
	Local $aParts[3] = [75, 150, -1]

	; Erstellt eine GUI
	$hGui = GUICreate("StatusBar: Hintergrundfarbe setzen", 400, 300)
	$hStatus = _GUICtrlStatusBar_Create($hGui)
	GUISetState(@SW_SHOW)

	; um das Ändern der Hintergrundeinstellung zumindest unter Windows 10 zu erlauben
	_WinAPI_SetWindowTheme($hStatus, "", "")

	; Setzt die Abschnitte
	_GUICtrlStatusBar_SetParts($hStatus, $aParts)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 1")
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 2", 1)
	_GUICtrlStatusBar_SetText($hStatus, "Abschnitt 3", 2)

	; Setzt die Hintergrundfarbe
	_GUICtrlStatusBar_SetBkColor($hStatus, $CLR_MONEYGREEN)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
