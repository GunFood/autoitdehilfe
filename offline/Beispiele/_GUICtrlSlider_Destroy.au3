#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGui, $idSlider

	; Erstellt eine GUI
	$hGui = GUICreate("Slider: Löschen (UDF)", 400, 296)
	$idSlider = _GUICtrlSlider_Create($hGui, 2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS))
	GUISetState(@SW_SHOW)

	MsgBox(8192 + 64, "Information", "Der Slider wird gelöscht")
	_GUICtrlSlider_Destroy($idSlider)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
