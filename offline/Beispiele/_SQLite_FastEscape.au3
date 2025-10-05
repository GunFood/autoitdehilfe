#include <SQLite.au3>
#include <SQLite.dll.au3>

_SQLite_Startup()
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", "SQLite3.dll kann nicht geladen werden!")
	Exit -1
EndIf
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)

Local $sTestString, $i, $aRow

For $i = 1 To 32 * 1024 ; Eine große Zahl an Buchstaben im Unicode-Plan 0
	$sTestString &= ChrW($i)
Next

_SQLite_Open()
_SQLite_Exec(-1, "CREATE TABLE test (a text);")
_SQLite_Exec(-1, "INSERT INTO test VALUES (" & _SQLite_FastEscape($sTestString) & ")")
_SQLite_QuerySingleRow(-1, "SELECT a FROM test;", $aRow)

If $aRow[0] == $sTestString Then ConsoleWrite("! Identisch !" & @CRLF)
_SQLite_Shutdown()
