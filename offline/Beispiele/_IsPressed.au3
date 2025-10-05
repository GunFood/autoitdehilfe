; == Beispiel 1: _Wird mit $vkey als Zeichenfolge ausgedrückt

#include <Misc.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIvkeysConstants.au3>

Local $hDLL = DllOpen("user32.dll")

While 1
	If _IsPressed("10", $hDLL) Then
		ConsoleWrite("_IsPressed - Shift-Taste wurde gedrückt. @extended = " & @extended & @CRLF)
		; Wartet bis die Taste wieder losgelassen wurde.
		While _IsPressed("10", $hDLL)
			Sleep(100)
		WEnd
		ConsoleWrite("_IsPressed - Shift-Taste wurde losgelassen. @extended = " & @extended & @CRLF)
	ElseIf _IsPressed("1B", $hDLL) Then
		ConsoleWrite("_IsPressed - Esc-Taste wurde gedrückt. @extended = " & @extended & @CRLF)
		MsgBox($MB_SYSTEMMODAL, "_IsPressed", "Da Esc-Taste gedrückt wurde wird die Anwendung beendet.", 3)
		ExitLoop
	EndIf
	Sleep(100)
WEnd

DllClose($hDLL)
