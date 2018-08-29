#include <MsgBoxConstants.au3>

If ProcessExists("SciTE.exe") = 0 Then
	MsgBox($MB_SYSTEMMODAL, "", "Es wird die SciTE.exe benötigt, damit in der Konsole die Meldungen gelesen werden können.")
EndIf

Example()

Func Example()
	; Registriert die Funktion MyAdLibFunc(), welche alle 250ms aufgerufen wird (Standard).
	AdlibRegister("MyAdLibFunc")

	; Trotz der Pause läuft die AdLib Funktion weiter.
	Sleep(1000)

	; AdLib Funktionen laufen nicht während eine blockierende Funktion wie z. B. MsgBox, InputBox, WinWait, WinWaitClose, usw. gezeigt wird.
	MsgBox($MB_SYSTEMMODAL, "", "Es wird keine Meldung in der Konsole gezeigt während das Nachrichtenfenster angezeigt wird.")

	; Die AdLib Funktion MyAdLibFunc() beginnt erneut.
	Sleep(2000)

	; Deregistriert die Funktion MyAdLibFunc(), welche alle 250ms aufgerufen wird (Standard).
	AdlibUnRegister("MyAdLibFunc")
EndFunc   ;==>Example

Func MyAdLibFunc()
	; Weist eine statischen Variable zu um die Anzahl der Funktionsaufrufe festzuhalten.
	Local Static $iCount = 0
	$iCount += 1

	ConsoleWrite("MyAdLibFunc wurde " & $iCount & " mal aufgerufen" & @CRLF)
EndFunc   ;==>MyAdLibFunc
