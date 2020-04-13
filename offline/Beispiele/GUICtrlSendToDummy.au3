#include <GUIConstantsEx.au3>

Global $g_idUserDummy, $g_iState = 0

Example()

Func Example()
	Opt("GUIOnEventMode", 1) ; Setzt die Option, damit GUIOnEventMode verwendet wird.

	GUICreate("GUISendToDummy", 220, 200, 100, 200)
	GUISetBkColor(0x00E0FFFF) ; Ändert die Hintergrundfarbe der GUI.
	GUISetOnEvent($GUI_EVENT_CLOSE, "OnExit") ; Setzt ein Event, welches die 'OnExit'-Funktion aufruft.

	$g_idUserDummy = GUICtrlCreateDummy()
	GUICtrlSetOnEvent(-1, "OnDummy") ; Setzt ein Event, welches die 'OnDummy'-Funktion aufruft, wenn dieses Control ausgewählt wurde.

	GUICtrlCreateButton("Click", 70, 170, 85, 25)
	GUICtrlSetOnEvent(-1, "OnClick") ; Setzt ein Event, welches die 'OnClick'-Funktion aufruft, wenn dieses Control ausgewählt wurde.

	GUICtrlSendToDummy($g_idUserDummy, 1) ; Setzt den Status auf geklickt. Der Status kann mit GUICtrlRead() abgefagt werden.

	; Zeigt die GUI
	GUISetState(@SW_SHOW)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst..
	While 1
		Sleep(100)
	WEnd
EndFunc   ;==>Example

Func OnClick()
	Return GUICtrlSendToDummy($g_idUserDummy) ; Sendet eine Nachricht zu dem Dummy-Control, wodurch OnDummy() ausgelöst wird.
EndFunc   ;==>OnClick


Func OnDummy()
	If GUICtrlRead($g_idUserDummy) Then
		GUISetBkColor(0x000000FF) ; Ändert die Hintergrundfarbe
	Else
		Exit
	EndIf
EndFunc   ;==>OnDummy

Func OnExit()
	Exit ; Beendet das Skript
EndFunc   ;==>OnExit
