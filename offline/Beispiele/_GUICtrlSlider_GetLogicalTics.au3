#include <GUIConstantsEx.au3>
#include <GuiSlider.au3>
#include <WindowsConstants.au3>

Global $g_idMemo

Example()

Func Example()
	Local $idSlider, $aTics

	; Erstellt eine GUI
	GUICreate("Slider: Ermittelt die logischen Positionen für die Skalenstriche", 550, 296)
	$idSlider = GUICtrlCreateSlider(2, 2, 300, 20, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS))
	$g_idMemo = GUICtrlCreateEdit("", 2, 32, 546, 266, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	$aTics = _GUICtrlSlider_GetLogicalTics($idSlider)
	MemoWrite("Anzahl der Skalenstriche inklusive dem ersten und letzten : " & UBound($aTics))
	For $x = 0 To UBound($aTics) - 1
		MemoWrite(StringFormat("(%02d) logischen Positionen für die Skalenstriche ..........: %d", $x, $aTics[$x]))
	Next

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
	GUIDelete()
EndFunc   ;==>Example

; Gibt eine Zeile im Memo-Fenster aus
Func MemoWrite($sMessage)
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
