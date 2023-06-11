; keine Versionsreferenz, deshalb muss die Datei in einem der folgenden Ordner existieren: @ScriptDir, @WorkingDir, @SystemDir oder @WindowsDir

#include <MsgBoxConstants.au3>
#include <SQLite.au3>

Local $sSQliteDll
$sSQliteDll = _SQLite_Startup()
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", "SQLite3.dll konnte nicht geladen werden!" & @CRLF & @CRLF & _
			"Nicht gefunden in @ScriptDir, @WorkingDir, @SystemDir oder @WindowsDir")
	Exit -1
EndIf

MsgBox($MB_SYSTEMMODAL, "SQLite3.dll geladen", $sSQliteDll & " (" & _SQLite_LibVersion() & ")")
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
_SQLite_Shutdown()
