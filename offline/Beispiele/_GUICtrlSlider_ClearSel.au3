#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $idSlider

	; Erstellt eine GUI
	GUICreate("Slider: Gesetzten Bereich löschen (Intern)", 400, 296)
	$idSlider = GUICtrlCreateSlider(2, 2, 396, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS, $TBS_ENABLESELRANGE))
	GUISetState(@SW_SHOW)

	; Setzt den Bereich
	_GUICtrlSlider_SetSel($idSlider, 10, 50)

	MsgBox(8192 + 64, "Information", "Löscht den gesetzten Bereich")
	; Löscht den Bereich
	_GUICtrlSlider_ClearSel($idSlider)

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example
