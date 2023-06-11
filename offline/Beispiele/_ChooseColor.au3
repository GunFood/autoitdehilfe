#include <GUIConstantsEx.au3>
#include <Misc.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hGUI, $idCOLORREF, $idBGR, $idRGB, $idMemo, $idRGBwA1, $idRGBwA2, $idClear

	$hGUI = GUICreate("_ChooseColor() Beispiel", 400, 300)
	$idMemo = GUICtrlCreateEdit("", 2, 55, 396, 200, BitOR($WS_VSCROLL, $WS_HSCROLL))
	GUICtrlSetFont($idMemo, 10, 400, 0, "Courier New")
	$idCOLORREF = GUICtrlCreateButton("COLORREF", 40, 10, 80, 40)
	$idBGR = GUICtrlCreateButton("BGR", 130, 10, 80, 40)
	$idRGB = GUICtrlCreateButton("RGB", 220, 10, 80, 40)
	$idClear = GUICtrlCreateButton("Leeren", 310, 10, 60, 40)
	$idRGBwA1 = GUICtrlCreateButton("RGB + benutzerdefiniert #1", 60, 260, 140, 40)
	$idRGBwA2 = GUICtrlCreateButton("RGB + benutzerdefiniert #2", 230, 260, 140, 40)
	GUISetState(@SW_SHOW)

	Local $aCustColors1[17]
	$aCustColors1[0] = -9  ; Initialisierung der benutzerdefinierten Farben
	$aCustColors1[3] = 0xFF0000 ; wenn man nicht möchte,
	$aCustColors1[16] = 0x0000FF ; die Schnittstelle zu laden.
	_ChooseColor($aCustColors1)

	Local $aCustColors2[17]
	$aCustColors2[2] = 0x0000FF
	$aCustColors2[15] = 0xFF0000

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				GUIDelete()
				ExitLoop
			Case $idClear
				GUICtrlSetState($idClear, $GUI_DISABLE)
				_ChooseColor(-10)
				Sleep(200) ; etwas Feedback, um zu zeigen, dass etwas getan wurde =)
				GUICtrlSetState($idClear, $GUI_ENABLE)
			Case $idCOLORREF
				_ShowChoice($hGUI, $idMemo, 0, _ChooseColor(0, 255, 0, $hGUI), "Gewählte COLORREF-Farbe: ")
			Case $idBGR
				_ShowChoice($hGUI, $idMemo, 2, _ChooseColor(2, 0x808000, 1, $hGUI), "Gewählte BGR-Farbe: ")
			Case $idRGB
				_ShowChoice($hGUI, $idMemo, 2, _ChooseColor(2, 0x0080C0, 2, $hGUI), "Gewählte RGB-Farbe: ")
			Case $idRGBwA1
				$aCustColors1[0] = 2 ; dies ist der "ReturnType"
				$aCustColors1 = _ChooseColor($aCustColors1, 0x0080C0, 2, $hGUI) ; um die gespeicherten benutzerdefinierten Farben zurück in das Array zu aktualisieren
				_ShowChoice($hGUI, $idMemo, 2, $aCustColors1[0], "RGB-Hex-Farbe deiner Wahl ( #1 ): ")
			Case $idRGBwA2
				$aCustColors2[0] = 2
				_ShowChoice($hGUI, $idMemo, 2, _ChooseColor($aCustColors2, 0x0080C0, 2, $hGUI)[0], "RGB-Hex-Farbe deiner Wahl ( #2 ): ")

		EndSwitch
	WEnd
EndFunc   ;==>Example

Func _ShowChoice($hGUI, $idMemo, $Type, $Choose, $sMessage)
	Local $sCr
	If $Choose <> -1 Then

		If $Type = 0 Then ; Konvertiere COLORREF in RGB für dieses Beispiel
			$sCr = Hex($Choose, 6)
			GUISetBkColor('0x' & StringMid($sCr, 5, 2) & StringMid($sCr, 3, 2) & StringMid($sCr, 1, 2), $hGUI)
		Else
			GUISetBkColor($Choose, $hGUI)
		EndIf

		GUICtrlSetData($idMemo, $sMessage & $Choose & @CRLF, 1)

	Else
		GUICtrlSetData($idMemo, "Farbauswahl vom Benutzer abgebrochen!" & @CRLF, 1)
	EndIf
EndFunc   ;==>_ShowChoice
