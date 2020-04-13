#include <Misc.au3>
#include <MsgBoxConstants.au3>

Local $hDLL = DllOpen("user32.dll")

While 1
	If _IsPressed("10", $hDLL) Then
		ConsoleWrite("_IsPressed - Shift-Taste wurde gedrückt." & @CRLF)
		; Wartet bis die Taste wieder losgelassen wurde.
		While _IsPressed("10", $hDLL)
			Sleep(250)
		WEnd
		ConsoleWrite("_IsPressed - Shift-Taste wurde losgelassen." & @CRLF)
	ElseIf _IsPressed("1B", $hDLL) Then
		MsgBox($MB_SYSTEMMODAL, "_IsPressed", "Da Esc-Taste gedrückt wurde wird die Anwendung beendet.")
		ExitLoop
	EndIf
	Sleep(250)
WEnd

DllClose($hDLL)
