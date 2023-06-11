#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iOldOpt = Opt("GUICoordMode", 1)

	Local $hGui = GUICreate("Meine GUI: Iconrennen", 350, 74, -1, -1)
	GUICtrlCreateLabel("", 331, 0, 1, 74, 5)
	Local $idIcon1 = GUICtrlCreateIcon(@ScriptDir & '\Extras\dinosaur.ani', -1, 0, 0, 32, 32)
	Local $idIcon2 = GUICtrlCreateIcon(@ScriptDir & '\Extras\horse.ani', -1, 0, 40, 32, 32)

	GUISetState(@SW_SHOW)

	Local $a = 0, $b = 0
	While ($a < 300) And ($b < 300)
		$a += Random(0, 1, 1)
		$b += Random(0, 1, 1)
		GUICtrlSetPos($idIcon1, $a, 0)
		GUICtrlSetPos($idIcon2, $b, 40)
		Sleep(10)
	WEnd
	Opt("GUICoordMode", $iOldOpt)
	If $a > $b Then
		MsgBox($MB_SYSTEMMODAL, 'Rennergebnis', 'Der Dinosaurier hat gewonnen', 0, $hGui)
	Else
		MsgBox($MB_SYSTEMMODAL, 'Rennergebnis', 'Das Pferd hat gewonnen', 0, $hGui)
	EndIf
EndFunc   ;==>Example
