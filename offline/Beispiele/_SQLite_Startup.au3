; die SQLite.dll Version muß passen

#include <MsgBoxConstants.au3>
#include <SQLite.au3>
#include <SQLite.dll.au3>

Local $sSQliteDll = _SQLite_Startup()

If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", "sqlite3.dll konnte nicht geladen werden!" & @CRLF & @CRLF & _
			"Nicht gefunden in @ScriptDir, @WorkingDir," & @CRLF & @TAB & "@LocalAppDataDir\AutoIt v3\SQLite," & @CRLF & @TAB & "@SystemDir ode @WindowsDir")
	Exit -1
EndIf
MsgBox($MB_SYSTEMMODAL, "SQLite3.dll geladen", $sSQliteDll & " (" & _SQLite_LibVersion() & ")")
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
_SQLite_Shutdown()
