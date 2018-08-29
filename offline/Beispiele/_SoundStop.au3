#include <MsgBoxConstants.au3>
#include <Sound.au3>

Local $aSound = _SoundOpen(@WindowsDir & "\media\Windows XP Startup.wav")
If @error = 2 Then
	MsgBox($MB_SYSTEMMODAL, "Fehler", "Die Datei existiert nicht.")
	Exit
ElseIf @extended <> 0 Then
	Local $iExtended = @extended ; Zuweisung, weil @extended nach DllStructCreate() geändert wird
	Local $tText = DllStructCreate("char[128]")
	DllCall("winmm.dll", "short", "mciGetErrorStringA", "str", $iExtended, "struct*", $tText, "int", 128)
	MsgBox($MB_SYSTEMMODAL, "Fehler", "Öffnen fehlgeschlagen." & @CRLF & "Fehlernummer: " & $iExtended & @CRLF & "Fehlerbeschreibung: " & DllStructGetData($tText, 1) & @CRLF & "Beachte: Möglicherweise kann der Sound dennoch korrekt abgespielt werden.")
Else
	MsgBox($MB_SYSTEMMODAL, "Erfolgsmeldung", "Die Datei wurde erfolgreich geöffnet.")
EndIf

_SoundPlay($aSound)

While 1
	Sleep(100)
	If _SoundPos($aSound, 2) >= 1000 Then
		_SoundStop($aSound)
		ExitLoop
	EndIf
WEnd

; Zeigt, dass der Sound nach dem Stoppen wieder von Beginn an abgespielt wird.
_SoundPlay($aSound, 1)

_SoundClose($aSound)
