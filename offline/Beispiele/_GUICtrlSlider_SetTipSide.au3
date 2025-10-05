#include <GuiConstantsEx.au3>
#include <GuiSlider.au3>

Example()

Func Example()
	Local $idRdo_Bottom, $idRdo_Left, $idRdo_Right, $idRdo_Top, $idSlider, $idSlider2

	; Erstellt eine GUI
	GUICreate("Slider: Positioniert ein ToolTip-Control", 400, 296)
	$idSlider = GUICtrlCreateSlider(2, 2, 375, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS))
	$idSlider2 = GUICtrlCreateSlider(380, 2, 20, 292, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_VERT))
	GUISetState(@SW_SHOW)

	GUICtrlCreateGroup("ToolTip horizontal", 2, 25, 120, 120)
	$idRdo_Bottom = GUICtrlCreateRadio("Unten", 5, 40, 108, 20)
	$idRdo_Top = GUICtrlCreateRadio("Oben", 5, 115, 108, 20)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlSetState($idRdo_Top, $GUI_CHECKED)

	GUICtrlCreateGroup("ToolTip vertikal", 130, 25, 120, 120)
	$idRdo_Left = GUICtrlCreateRadio("Links", 132, 65, 108, 20)
	$idRdo_Right = GUICtrlCreateRadio("Rechts", 132, 90, 108, 20)
	GUICtrlCreateGroup("", -99, -99, 1, 1)
	GUICtrlSetState($idRdo_Left, $GUI_CHECKED)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $idRdo_Bottom
				_GUICtrlSlider_SetTipSide($idSlider, $TBTS_BOTTOM)
			Case $idRdo_Left
				_GUICtrlSlider_SetTipSide($idSlider2, $TBTS_LEFT)
			Case $idRdo_Right
				_GUICtrlSlider_SetTipSide($idSlider2, $TBTS_RIGHT)
			Case $idRdo_Top
				_GUICtrlSlider_SetTipSide($idSlider, $TBTS_TOP)
		EndSwitch
	WEnd
	GUIDelete()
EndFunc   ;==>Example
