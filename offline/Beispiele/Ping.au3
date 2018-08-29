#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Pingt die AutoIt Website mit einem Timeout von 250ms an.
	Local $iPing = Ping("autoitscript.com", 250)

	If $iPing Then ; Wenn ein Wert größer 0 ist, so wird die folgende Nachricht angezeigt.
		MsgBox($MB_SYSTEMMODAL, "", "Die roundtrip-time beträgt: " & $iPing & "ms.")
	Else
		MsgBox($MB_SYSTEMMODAL, "", "Es trat ein Fehler auf. Der @error Wert lautet: " & @error)
	EndIf
EndFunc   ;==>Example
