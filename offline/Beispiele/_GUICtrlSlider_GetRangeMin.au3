#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("Slider: Setzt und ermittelt die minimale Position (v" & @AutoItVersion & ")", 500, 296)
	Local $idSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Ermittelt die minimale Position
	MsgBox($MB_SYSTEMMODAL, "Information", "minimale Position: " & _GUICtrlSlider_GetRangeMin($idSlider))

	; Setzt die minimale Position
	_GUICtrlSlider_SetRangeMin($idSlider, 20)

	; Ermittelt die minimale Position
	MsgBox($MB_SYSTEMMODAL, "Information", "minimale Position: " & _GUICtrlSlider_GetRangeMin($idSlider))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
