#include "Extras\HelpFileInternals.au3"

#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $idSlider, $aTics

	; Erstellt eine GUI
	GUICreate("Slider: Ermittelt die logischen Positionen für die Skalenstriche", 550, 296)
	$idSlider = GUICtrlCreateSlider(2, 2, 300, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS))
	_MemoCreate(2, 32, 396, 266, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	$aTics = _GUICtrlSlider_GetLogicalTics($idSlider)
	_MemoWrite("Anzahl der Skalenstriche inklusive dem ersten und letzten : " & UBound($aTics))
	For $x = 0 To UBound($aTics) - 1
		_MemoWrite(StringFormat("(%02d) logischen Positionen für die Skalenstriche ..........: %d", $x, $aTics[$x]))
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example