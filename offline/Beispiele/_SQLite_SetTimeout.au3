#include <File.au3>
#include <MsgBoxConstants.au3>
#include <SQLite.au3>
#include <SQLite.dll.au3>

_SQLite_Startup()
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)

Local $sDatabase, $hDB_a, $hDB_b, $iTimer, $iRval
$sDatabase = _TempFile()
$hDB_a = _SQLite_Open($sDatabase)
$hDB_b = _SQLite_Open($sDatabase)

_SQLite_Exec($hDB_a, "BEGIN EXCLUSIVE;")
_SQLite_Exec($hDB_a, "CREATE TABLE Test (a,b,c);")
_SQLite_Exec($hDB_a, "INSERT INTO Test VALUES (1,2,3);")
; Tabelle 'Test' ist jetzt beschäftigt...

_SQLite_SetTimeout($hDB_b, 0)
$iTimer = TimerInit()
$iRval = _SQLite_Exec($hDB_b, "SELECT * FROM Test") ; Das wird fehlschlagen!
MsgBox($MB_SYSTEMMODAL, "_SQLite_SetTimeout: Beispiel ohne Timeout", "Zeit: " & TimerDiff($iTimer) & @CRLF _
		 & "Fehler: " & _SQLite_ErrMsg($hDB_b) & @CRLF)
_SQLite_SetTimeout($hDB_b, 5000)
$iTimer = TimerInit()
$iRval = _SQLite_Exec($hDB_b, "SELECT * FROM test") ; Das wird fehlschlagen!
MsgBox($MB_SYSTEMMODAL, "_SQLite_SetTimeout: Beispiel mit 5s Timeout", "Zeit: " & TimerDiff($iTimer) & @CRLF _
		 & "Fehler: " & _SQLite_ErrMsg($hDB_b) & @CRLF)
_SQLite_Exec($hDB_a, "END;")
_SQLite_Close($hDB_a)
_SQLite_Close($hDB_b)
_SQLite_Shutdown()
FileDelete($sDatabase)
