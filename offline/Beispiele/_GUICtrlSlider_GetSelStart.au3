#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("Slider: Setzt und ermittelt die logische Startposition des aktuell markierten Bereiches (v" & @AutoItVersion & ")", 700, 296)
	Local $idSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Setzt die logische Startposition des aktuell markierten Bereiches
	_GUICtrlSlider_SetSelStart($idSlider, 10)

	; Ermittelt die logische Startposition des aktuell markierten Bereiches
	MsgBox($MB_SYSTEMMODAL, "Information", "logische Startposition des aktuell markierten Bereiches: " & _GUICtrlSlider_GetSelStart($idSlider))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
