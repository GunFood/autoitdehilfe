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

ConsoleWrite("Status nach _SoundOpen: " & _SoundStatus($aSound) & @CRLF)

_SoundPlay($aSound)
ConsoleWrite("Status nach _SoundPlay: " & _SoundStatus($aSound) & @CRLF)

Sleep(1000)

_SoundPause($aSound)
ConsoleWrite("Status nach _SoundPause: " & _SoundStatus($aSound) & @CRLF)

Sleep(1000)
_SoundResume($aSound)

While 1
	Sleep(100)
	If _SoundPos($aSound, 2) = _SoundLength($aSound, 2) Then ExitLoop
WEnd

_SoundClose($aSound)
