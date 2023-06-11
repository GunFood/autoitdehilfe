; In diesem Beispiel, lässt sich das Makro einmal als Name und einmal als Wert ausgeben.
_debugMakro("@ScriptDir")

Func _debugMakro($_makroString)
	ConsoleWrite($_makroString & " >>> " & Execute($_makroString) & @CRLF)
EndFunc   ;==>_debugMakro