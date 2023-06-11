#include <MsgBoxConstants.au3>

; Öffnen des MediaPlayers auf einem REMOTE Computer

Local $oRemoteMedia = ObjCreate("MediaPlayer.MediaPlayer.1", "Name_des_Remote-PC")

If Not @error Then
	MsgBox($MB_SYSTEMMODAL, "Remote ObjCreate Test", "ObjCreate() für ein Remote-Mediaplayer Objekt erfolgreich !")
	$oRemoteMedia.Open(@WindowsDir & "\media\Windows XP Startup.wav") ; Den Ton abspielen falls die Datei existiert
Else
	MsgBox($MB_SYSTEMMODAL, "Remote ObjCreate Test", "Fehler beim Öffnen des Remote-Objekts. Fehlercode: " & Hex(@error, 8))
EndIf
