#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("Slider: Setzt und ermittelt die logische Position des Skalenstriches (v" & @AutoItVersion & ")", 600, 296)
	Local $idSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Setzt die logische Position des Skalenstriches
	Local $iTic = Random(0, 100, 1)
	_GUICtrlSlider_SetTic($idSlider, $iTic)

	; Ermittelt die logische Position des Skalenstriches
	MsgBox($MB_SYSTEMMODAL, "Information", "Logische Position des Skalenstriches: " & _GUICtrlSlider_GetTic($idSlider, $iTic))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
