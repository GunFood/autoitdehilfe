#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $sName = InputBox(Default, "Bitte ein Wort eingeben.", "", " M", Default, Default, Default, Default, 10)
	Local $sMsg = ""
	Switch @error
		Case 2
			$sMsg = "Timeout "
			ContinueCase
		Case 1; Vorigen Case-Tree fortsetzen
			$sMsg &= "Abbruch"
		Case 0
			Switch $sName
				Case "a", "e", "i", "o", "u"
					$sMsg = "Vokal"
				Case "QP"
					$sMsg = "Mathematik"
				Case "Q" To "QZ"
					$sMsg = "Wissenschaft"
				Case Else
					$sMsg = "Sonstiges"
			EndSwitch
		Case Else
			$sMsg = "Irgendwas ging völlig schief."
	EndSwitch

	MsgBox($MB_SYSTEMMODAL, "", $sMsg)
EndFunc   ;==>Example
