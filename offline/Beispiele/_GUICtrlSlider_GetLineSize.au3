#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idSlider

	; Erstellt eine GUI
	GUICreate("Slider: Ermittelt die Anzahl von logischen Positionen in der sich der Slider bewegen lässt", 400, 296)
	$idSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Ermittelt die Anzahl von logischen Positionen in der sich der Slider bewegen lässt
	MsgBox($MB_SYSTEMMODAL, "Information", "Anzahl von logischen Positionen: " & _GUICtrlSlider_GetLineSize($idSlider))

	; Setzt die Anzahl von logischen Positionen in der sich der Slider bewegen lässt
	_GUICtrlSlider_SetLineSize($idSlider, 4)

	; Ermittelt die Anzahl von logischen Positionen in der sich der Slider bewegen lässt
	MsgBox($MB_SYSTEMMODAL, "Information", "Anzahl von logischen Positionen: " & _GUICtrlSlider_GetLineSize($idSlider))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
