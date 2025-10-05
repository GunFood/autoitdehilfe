#include <MsgBoxConstants.au3>
#include <SQLite.au3>
#include <SQLite.dll.au3>

Local $aRow
_SQLite_Startup()
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", "SQLite3.dll kann nicht geladen werden!")
	Exit -1
EndIf
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
_SQLite_Open() ; Öffnet eine DB im Speicher (:memory: database)
_SQLite_Exec(-1, "CREATE TEMP TABLE Einstellungen (Schlüssel,Wert);")
_SQLite_Exec(-1, "INSERT INTO Einstellungen (Schlüssel,Wert) VALUES ('1','Erste Einstellung');")
_SQLite_Exec(-1, "INSERT INTO Einstellungen (Schlüssel,Wert) VALUES ('2','Zweite Einstellung');")
_SQLite_Exec(-1, "INSERT INTO Einstellungen (Schlüssel,Wert) VALUES ('3','Dritte Einstellung');")
_SQLite_Exec(-1, "INSERT INTO Einstellungen (Schlüssel,Wert) VALUES ('4','Vierte Einstellung');")
_SQLite_QuerySingleRow(-1, "SELECT Wert FROM Einstellungen WHERE Schlüssel = '2' LIMIT 1;", $aRow) ; Wählt eine einzelne Zeile und ein einzelnes Feld!
MsgBox($MB_SYSTEMMODAL, "2. Einstellung:", $aRow[0])
_SQLite_Close()
_SQLite_Shutdown()
