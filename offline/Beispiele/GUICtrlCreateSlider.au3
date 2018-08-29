#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	GUICreate("Slider", 220, 100, 100, 200)
	GUISetBkColor(0x00E0FFFF) ; Ändert die Hintergrundfarbe
	Local $idSlider1 = GUICtrlCreateSlider(10, 10, 200, 20)
	GUICtrlSetLimit(-1, 200, 0) ; Ändert den Min/Max Wert
	Local $idButton = GUICtrlCreateButton("Wert?", 75, 70, 70, 20)
	GUISetState(@SW_SHOW)
	GUICtrlSetData($idSlider1, 45) ; Setzt den Cursor

	Local $idMsg
	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
		$idMsg = GUIGetMsg()

		If $idMsg = $idButton Then
			MsgBox($MB_SYSTEMMODAL, "slider1", GUICtrlRead($idSlider1), 2)
		EndIf
	Until $idMsg = $GUI_EVENT_CLOSE
EndFunc   ;==>Example
