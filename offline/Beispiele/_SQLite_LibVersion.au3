#include <MsgBoxConstants.au3>
#include <SQLite.au3>
#include <SQLite.dll.au3>

Local $sSQliteDll
$sSQliteDll = _SQLite_Startup()
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", "sqlite3.dll konnte nicht geladen werden!")
	Exit -1
EndIf
MsgBox($MB_SYSTEMMODAL, "SQLite3.dll geladen", $sSQliteDll)
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
_SQLite_Shutdown()
