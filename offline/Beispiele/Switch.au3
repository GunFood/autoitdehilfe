#include <MsgBoxConstants.au3>

Local $sMsg = ""

Switch @HOUR
	Case 6 To 11
		$sMsg = "Guten Morgen"
	Case 12 To 17
		$sMsg = "Guten Tag"
	Case 18 To 21
		$sMsg = "Guten Abend"
	Case Else
		$sMsg = "Warum bist du noch wach?"
EndSwitch

MsgBox($MB_SYSTEMMODAL, Default, $sMsg)
