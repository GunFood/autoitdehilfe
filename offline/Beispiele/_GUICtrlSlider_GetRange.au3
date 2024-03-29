#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt eine GUI
	GUICreate("Slider: Setzt und ermittelt den Bereich (v" & @AutoItVersion & ")", 500, 296)
	Local $idSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))

	GUISetState(@SW_SHOW)

	; Ermittelt den Bereich
	Local $aRange = _GUICtrlSlider_GetRange($idSlider)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Bereich: %d - %d", $aRange[0], $aRange[1]))

	; Setzt den Bereich
	_GUICtrlSlider_SetRange($idSlider, 20, 50)

	; Ermittelt den Bereich
	$aRange = _GUICtrlSlider_GetRange($idSlider)
	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("Bereich: %d - %d", $aRange[0], $aRange[1]))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
