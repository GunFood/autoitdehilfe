#include <GUIConstantsEx.au3>

Example()

Func Example()
	; Erstellt eine GUI mit verschiedenen Controls.
	Local $hGui = GUICreate("Example", 300, 200)

	; Erstellt ein Button-Control.
	Local $idButton_Notepad = GUICtrlCreateButton("Editor starten", 120, 170, 85, 25)
	Local $idButton_Close = GUICtrlCreateButton("Schließen", 210, 170, 85, 25)

	; Zeigt die GUI
	GUISetState(@SW_SHOW, $hGui)

	Local $iPID = 0

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE, $idButton_Close
				ExitLoop

			Case $idButton_Notepad
				; Startet den Editor mit einem maximierten Fenster.
				$iPID = Run("notepad.exe", "", @SW_SHOWMAXIMIZED)

		EndSwitch
	WEnd

	; Löscht die vorherige GUI und alle Controls.
	GUIDelete($hGui)

	; Schließt den Editorprozess durch die Verwendung der von Run zurückgegebenen PID.
	If $iPID Then ProcessClose($iPID)
EndFunc   ;==>Example
