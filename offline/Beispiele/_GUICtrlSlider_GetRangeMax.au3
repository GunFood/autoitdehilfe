#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("Slider: Setzt und ermittelt die maximale Position (v" & @AutoItVersion & ")", 500, 296)
	Local $idSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Ermittelt die maximale Position
	MsgBox($MB_SYSTEMMODAL, "Information", "maximale Position: " & _GUICtrlSlider_GetRangeMax($idSlider))

	; Setzt die maximale Position
	_GUICtrlSlider_SetRangeMax($idSlider, 50)

	; Ermittelt die maximale Position
	MsgBox($MB_SYSTEMMODAL, "Information", "maximale Position: " & _GUICtrlSlider_GetRangeMax($idSlider))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
