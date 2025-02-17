#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $tRECT, $idSlider

	; Erstellt eine GUI
	GUICreate("Slider: Ermittelt die Größe und Position des begrenzenden Rechtecks", 550, 296)
	$idSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Ermittelt die Größe und Position des begrenzenden Rechtecks
	$tRECT = _GUICtrlSlider_GetChannelRectEx($idSlider)

	MsgBox($MB_SYSTEMMODAL, "Information", StringFormat("[%d][%d][%d][%d]", _
			DllStructGetData($tRECT, "Left"), DllStructGetData($tRECT, "Top"), _
			DllStructGetData($tRECT, "Right"), DllStructGetData($tRECT, "Bottom")))

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
