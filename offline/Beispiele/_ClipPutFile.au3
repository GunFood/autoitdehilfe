#include <Misc.au3>
#include <MsgBoxConstants.au3>

; Fügt den folgenden Inhalt der Zwischenablage hinzu.
Local $bReturn = _ClipPutFile(@ScriptFullPath & "|" & @ScriptDir & "|" & @SystemDir)
If Not $bReturn Then
	MsgBox($MB_SYSTEMMODAL, "_ClipPutFile()-Aufruf schlug fehl!", "@error = " & @error)
Else
	MsgBox($MB_SYSTEMMODAL, "_ClipPutFile()", "Inhalt der Zwischenablage:" & @CRLF & ClipGet())
EndIf
