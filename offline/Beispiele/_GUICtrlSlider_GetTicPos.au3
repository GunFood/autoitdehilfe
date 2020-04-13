#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iTic = Random(1, 99, 1), $idSlider

	; Erstellt eine GUI
	GUICreate("Slider: Ermittelt die aktuelle physikalische Position des Skalenstrichs", 600, 296)
	$idSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Ermittelt die aktuelle physikalische Position des Skalenstrichs
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Skalenstrich %d: X Position: %d", $iTic, _GUICtrlSlider_GetTicPos($idSlider, $iTic)))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
