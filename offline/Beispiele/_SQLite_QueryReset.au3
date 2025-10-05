#include <MsgBoxConstants.au3>
#include <SQLite.au3>
#include <SQLite.dll.au3>

Local $hQuery, $aRow, $iSwitch
_SQLite_Startup()
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", "SQLite3.dll kann nicht geladen werden!")
	Exit -1
EndIf
_SQLite_Open()
_SQLite_Exec(-1, "CREATE TABLE tblTest (a,b,c);")
_SQLite_Exec(-1, "INSERT INTO tblTest VALUES ('1','1','1');" & _ ; Zeile 1
		"INSERT INTO tblTest VALUES ('2','2','2');" & _ ; Zeile 2
		"INSERT INTO tblTest VALUES ('3','3','3');") ; Zeile 3
_SQLite_Query(-1, "SELECT RowID,* FROM tblTest;", $hQuery)
While _SQLite_FetchData($hQuery, $aRow) = $SQLITE_OK
	$iSwitch = MsgBox(($MB_YESNO + $MB_SYSTEMMODAL), "Zeile: " & $aRow[0], $aRow[1] & "," & $aRow[2] & "," & $aRow[3] & @CRLF & _
			"Weitere Zeile abfragen?")
	If $iSwitch = 6 Then ; Ja
		If $aRow[0] = 3 Then _SQLite_QueryReset($hQuery)
	Else ; Nein
		_SQLite_QueryFinalize($hQuery)
		ExitLoop
	EndIf
WEnd
_SQLite_Close()
_SQLite_Shutdown()
