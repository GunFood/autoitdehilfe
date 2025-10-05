; == Gibt Daten ohne Kopfzeile zurück

#include <MsgBoxConstants.au3>
#include <SQLite.au3>
#include <SQLite.dll.au3>

Local $aResult, $iRows, $aNames, $iRval

_SQLite_Startup()
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", "SQLite3.dll kann nicht geladen werden!")
	Exit -1
EndIf
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
_SQLite_Open() ; Öffnet eine :memory: Datenbank
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", "Kann die Datenbank nicht laden!")
	Exit -1
EndIf

; Beispiel Tabelle
; Name        | Alter
; -----------------------
; Alice       | 43
; Bob         | 28
; Cindy       | 21

If Not _SQLite_Exec(-1, "CREATE TEMP TABLE persons (Name, Age);") = $SQLITE_OK Then _
		MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", _SQLite_ErrMsg())
If Not _SQLite_Exec(-1, "INSERT INTO persons VALUES ('Alice','43');") = $SQLITE_OK Then _
		MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", _SQLite_ErrMsg())
If Not _SQLite_Exec(-1, "INSERT INTO persons VALUES ('Bob','28');") = $SQLITE_OK Then _
		MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", _SQLite_ErrMsg())
If Not _SQLite_Exec(-1, "INSERT INTO persons VALUES ('Cindy','21');") = $SQLITE_OK Then _
		MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", _SQLite_ErrMsg())

$iRval = _SQLite_GetTableData2D(-1, "SELECT * FROM persons;", $aResult, $iRows, $aNames)
If $iRval = $SQLITE_OK Then
	_SQLite_Display2DResult($aResult)

	; $aResult sieht so aus:
	; Alice  43
	; Bob    28
	; Cindy  21

Else
	MsgBox($MB_SYSTEMMODAL, "SQLite Fehler: " & $iRval, _SQLite_ErrMsg())
EndIf

_SQLite_Close()
_SQLite_Shutdown()
