#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("Slider: Setzt und ermittelt die Länge des Sliders (v" & @AutoItVersion & ")", 500, 296)
	Local $idSlider = GUICtrlCreateSlider(2, 2, 396, 25, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_FIXEDLENGTH))
	GUISetState(@SW_SHOW)

	; Ermittelt die Länge des Sliders
	MsgBox($MB_SYSTEMMODAL, "Information", "Länge des Sliders: " & _GUICtrlSlider_GetThumbLength($idSlider))

	; Setzt die Länge des Sliders
	_GUICtrlSlider_SetThumbLength($idSlider, 10)

	; Ermittelt die Länge des Sliders
	MsgBox($MB_SYSTEMMODAL, "Information", "Länge des Sliders: " & _GUICtrlSlider_GetThumbLength($idSlider))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
