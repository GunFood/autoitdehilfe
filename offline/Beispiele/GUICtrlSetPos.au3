#include <GUIConstantsEx.au3>

Example()

Func Example()
	GUICreate("Meine GUI mit Positionsverschiebung eines Labels", 450) ; Erstellt ein GUI-Fenster welches mittig ausgerichtet wird

	GUISetFont(16)
	Local $idLabel = GUICtrlCreateLabel("Mein sich bewegendes Label", 10, 20)

	GUISetState(@SW_SHOW)

	Local $idMsg, $bToggle = False
	While 1
		$idMsg = GUIGetMsg()

		If $idMsg = $GUI_EVENT_CLOSE Then Exit
		$bToggle = Not $bToggle
		If $bToggle Then
			GUICtrlSetPos($idLabel, 20, 20)
		Else
			GUICtrlSetPos($idLabel, 20, 30)
		EndIf
		Sleep(60)
	WEnd
EndFunc   ;==>Example
