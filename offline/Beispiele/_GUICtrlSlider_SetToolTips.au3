#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hWndTT, $idSlider

	; Erstellt eine GUI
	GUICreate("Slider: Weist ein ToolTip-Control zu", 500, 296)
	$idSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Ermittelt das Handle zum ToolTip-Control
	$hWndTT = _GUICtrlSlider_GetToolTips($idSlider)
	MsgBox($MB_SYSTEMMODAL, "Information", "Handle des ToolTips: " & $hWndTT)

	; Weist dem Slider-Control ein ToolTip-Control zu
	_GUICtrlSlider_SetToolTips($idSlider, $hWndTT)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
