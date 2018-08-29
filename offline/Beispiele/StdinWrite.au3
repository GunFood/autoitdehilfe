#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $iPID = Run("sort.exe", @SystemDir, @SW_HIDE, $STDIN_CHILD + $STDOUT_CHILD)

	; Schreibt den zu sortierenden String in sort.exe's STDIN
	StdinWrite($iPID, "Banana" & @CRLF & "Elephant" & @CRLF & "Apple" & @CRLF & "Deer" & @CRLF & "Car" & @CRLF)

	; Der Aufruf von StdinWrite ohne den zweiten Parameter schließt den Stream.
	StdinWrite($iPID)

	Local $sOutput = "" ; Speichert die Ausgbabe von StdoutRead in einer Variablen.

	While 1
		$sOutput &= StdoutRead($iPID) ; Liest den Stdout Stream der von Run zurückgegebenen PID.
		If @error Then ; Beendet die Schleife falls der Prozess beendet wurde oder StdoutRead einen Fehler zurückgibt.
			ExitLoop
		EndIf
	WEnd

	MsgBox($MB_SYSTEMMODAL, "", "Der sortierte String lautet: " & @CRLF & $sOutput)
EndFunc   ;==>Example
