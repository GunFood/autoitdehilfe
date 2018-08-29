#include <GUIConstantsEx.au3>
#include <Misc.au3>
#include <WindowsConstants.au3>

Example()

Func Example()
	Local $hGUI, $idCOLORREF, $idBGR, $idRGB, $idMemo

	$hGUI = GUICreate("_ChooseColor() Beispiel", 400, 300)
	$idMemo = GUICtrlCreateEdit("", 2, 55, 396, 200, BitOR($WS_VSCROLL, $WS_HSCROLL))
	GUICtrlSetFont($idMemo, 10, 400, 0, "Courier New")
	$idCOLORREF = GUICtrlCreateButton("COLORREF", 70, 10, 80, 40)
	$idBGR = GUICtrlCreateButton("BGR", 160, 10, 80, 40)
	$idRGB = GUICtrlCreateButton("RGB", 250, 10, 80, 40)
	GUISetState(@SW_SHOW)

	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				ExitLoop
			Case $idCOLORREF
				_ShowChoice($hGUI, $idMemo, 0, _ChooseColor(0, 255, 0, $hGUI), "Gewählte COLORREF-Farbe: ")
			Case $idBGR
				_ShowChoice($hGUI, $idMemo, 1, _ChooseColor(2, 0x808000, 1, $hGUI), "Gewählte BGR-Farbe: ")
			Case $idRGB
				_ShowChoice($hGUI, $idMemo, 2, _ChooseColor(2, 0x0080C0, 2, $hGUI), "Gewählte RGB-Farbe: ")
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
