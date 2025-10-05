_Beispiel()
Func _Beispiel()
	For $o = 1 To 3 ; "Äußere Schleife"
		For $i = 1 To 10 ; "Innere Schleife"
			If $i = 1 Then ConsoleWrite(@CRLF)
			; Wenn "Äußere Schleife" im ersten Schritt und "Innere Schleife" im 3. Schritt ist, überspringe "Äußere Schleife" zum nächsten Schritt
			If $o = 1 And $i = 3 Then ContinueLoop 2
			; Wenn "Äußere Schleife" im zweiten Schritt und "Innere Schleife" im 5. Schritt ist, überspringe "Äußere Schleife" zum nächsten Schritt
			If $o = 2 And $i = 5 Then ContinueLoop 2
			; Wenn "Innere Schleife" im siebten Schritt ist, überspringe "Innere Schleife" zum nächsten Schritt
			If $i = 7 Then ContinueLoop
			ConsoleWrite(" Der Wert von $o=" & $o & "  $i=" & $i & @CRLF)
		Next
	Next
EndFunc   ;==>_Beispiel
