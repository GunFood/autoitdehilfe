; keine Versionsreferenz, deshalb muss die Datei in einem der folgenden Ordner existieren: @SystemDir, @WindowsDir, @ScriptDir or @WorkingDir

#include <MsgBoxConstants.au3>
#include <SQLite.au3>

Local $sSQliteDll
$sSQliteDll = _SQLite_Startup()
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", "SQLite3.dll konnte nicht geladen werden!" & @CRLF & @CRLF & _
			"Nicht gefunden in @SystemDir, @WindowsDir, @ScriptDir oder @WorkingDir")
	Exit -1
EndIf

MsgBox($MB_SYSTEMMODAL, "SQLite3.dll geladen", $sSQliteDll & " (" & _SQLite_LibVersion() & ")")
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
_SQLite_Shutdown()
