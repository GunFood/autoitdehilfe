; Beispiel 1
; In diesem Beispiel wird einer Variable der Wert 1 dazuaddiert
Local $a = 1
Local $v = Execute("$a+1") ; $v hat den Wert 2
ConsoleWrite($v & @CRLF)


; Beispiel 2
; In diesem Beispiel, lässt sich das Makro einmal als Name und einmal als Wert ausgeben.
_debugMakro("@ScriptDir")

Func _debugMakro($_makroString)
	ConsoleWrite($_makroString & " >>> " & Execute($_makroString) & @CRLF)
EndFunc   ;==>_debugMakro
