#include <MsgBoxConstants.au3>

For $i = 5 To 1 Step -1
	MsgBox($MB_SYSTEMMODAL, "", "Countdown!" & @CRLF & $i)
Next
MsgBox($MB_SYSTEMMODAL, "", "Start!")
