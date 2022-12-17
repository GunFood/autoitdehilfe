#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("Slider: Setzt und ermittelt Anfang und Ende des aktuell markierten Bereichs (v" & @AutoItVersion & ")", 700, 296)
	Local $idSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Setzt die Start- und Endposition des aktuellen markierten Bereichs
	_GUICtrlSlider_SetSel($idSlider, 10, 50)

	; Ermittelt die Start- und Endposition des aktuellen markierten Bereichs
	Local $aSel = _GUICtrlSlider_GetSel($idSlider)
	MsgBox(8256, "Information", StringFormat("Markierung: %d - %d", $aSel[0], $aSel[1]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
