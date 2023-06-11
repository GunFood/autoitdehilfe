#include <MsgBoxConstants.au3>
#include <Sound.au3>

Local $sound = _SoundOpen(@WindowsDir & "\media\Windows XP Startup.wav")
If @error = 2 Then
	MsgBox($MB_SYSTEMMODAL, "Fehler", "Die Datei existiert nicht.")
	Exit
ElseIf @extended <> 0 Then
	Local $iExtended = @extended ; Zuweisung, weil @extended nach DllStructCreate() geändert wird
	Local $stText = DllStructCreate("char[128]")
	DllCall("winmm.dll", "short", "mciGetErrorStringA", "str", $iExtended, "struct*", $tText, "int", 128)
	MsgBox($MB_SYSTEMMODAL, "Fehler", "Öffnen fehlgeschlagen." & @CRLF & "Fehlernummer: " & $iExtended & @CRLF & "Fehlerbeschreibung: " & DllStructGetData($stText, 1) & @CRLF & "Beachte: Möglicherweise kann der Sound dennoch korrekt abgespielt werden.")
Else
	MsgBox($MB_SYSTEMMODAL, "Erfolgsmeldung", "Die Datei wurde erfolgreich geöffnet.")
EndIf

_SoundPlay($sound, 0)

; Spielt 1 Sekunde des Sounds ab
Sleep(1000)

; Springt zur 2. Sekunde des Sounds und setzt die Wiedergabe ab dort fort
_SoundSeek($sound, 0, 0, 2)
ConsoleWrite("Nach _SoundSeek: " & _SoundPos($sound, 2) & " _SoundStatus: " & _SoundStatus($sound) & @CRLF)

_SoundSeek($sound, 0, 0, 1)
ConsoleWrite("Nach _SoundSeek1: " & _SoundPos($sound, 2) & " _SoundStatus: " & _SoundStatus($sound) & @CRLF)

_SoundPlay($sound, 0)

While 1
	Sleep(100)
	If _SoundPos($sound, 2) >= _SoundLength($sound, 2) Then ExitLoop
WEnd

_SoundClose($sound)
