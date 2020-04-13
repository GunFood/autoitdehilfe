#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idSlider

	; Erstellt eine GUI
	GUICreate("Slider: Setzt die logische Endposition des aktuell markierten Bereiches", 600, 296)
	$idSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Setzt die logische Endposition des aktuell markierten Bereiches
	_GUICtrlSlider_SetSelEnd($idSlider, 50)

	; Ermittelt die logische Endposition des aktuell markierten Bereiches
	MsgBox($MB_SYSTEMMODAL, "Information", "Logische Endposition des aktuell markierten Bereiches: " & _GUICtrlSlider_GetSelEnd($idSlider))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
