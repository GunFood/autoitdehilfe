#include <sqlite.au3>
#include <sqlite.dll.au3>

Local $hQuery
_SQLite_Startup()
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
_SQLite_Open()

; Ohne $sCallback ist es eine ergebnislose Abfrage
_SQLite_Exec(-1, "Create table tblTest (a,b int,c single not null);" & _
		"Insert into tblTest values ('1',2,3);" & _
		"Insert into tblTest values (Null,5,6);")

Local $d = _SQLite_Exec(-1, "Select oid,* From tblTest", "_cb") ; _cb wird für jede Zeile aufgerufen

Func _cb($aResult)
	For $s In $aResult
		ConsoleWrite($s & @TAB)
	Next
	ConsoleWrite(@CRLF)
	; Rückgabewert: $SQLITE_ABORT ; Bricht den Prozess ab und setzt @error in _SQLite_Exec()
EndFunc   ;==>_cb
_SQLite_Close()
_SQLite_Shutdown()

; Ausgabe:
;rowid	a	b	c
;~ 	1		1	2	3
;~ 	2			5	6
