#include <MsgBoxConstants.au3>
#include <SQLite.au3>
#include <SQLite.dll.au3>

_SQLite_Startup()
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", "SQLite3.dll kann nicht geladen werden!")
	Exit -1
EndIf
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
_SQLite_Open()
If $SQLITE_OK <> _SQLite_Exec(-1, "CREATE TABLE test ('a', 'b);") Then _ ; Ein Anführungszeichen nach b fehlt
		MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", "Fehlerkode: " & _SQLite_ErrCode() & @CRLF & "Fehlermeldung: " & _SQLite_ErrMsg())
_SQLite_Close()
_SQLite_Shutdown()
