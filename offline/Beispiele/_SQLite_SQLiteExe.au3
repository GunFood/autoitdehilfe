#include <File.au3>
#include <SQLite.au3>
#include <SQLite.dll.au3>
#include <StringConstants.au3>

; Dateinamen
Local $sTsvFile = FileGetShortName(_TempFile(@TempDir, "~", ".tsv"))
Local $sDbFile = FileGetShortName(_TempFile(@TempDir, "~", ".db"))

; Erstellt Tsv-Datei
FileWriteLine($sTsvFile, "a" & @TAB & "b" & @TAB & "c")
FileWriteLine($sTsvFile, "a1" & @TAB & "b1" & @TAB & "c1")
FileWriteLine($sTsvFile, "a2" & @TAB & "b2" & @TAB & "c2")

; Import (mittels SQLite3.exe)
Local $sIn, $sOut, $i, $sCreate = "CREATE TABLE TblImport (";
For $i = 1 To _StringCountOccurance(FileReadLine($sTsvFile, 1), @TAB) + 1
	$sCreate &= "Spalte_" & $i & ","
Next
$sCreate = StringTrimRight($sCreate, 1) & ");"
$sIn = $sCreate & @CRLF ; Erstellt Tabelle
$sIn &= ".separator t" & @CRLF ; Wähle @TAB als Separator
$sIn &= ".import '" & $sTsvFile & "' TblImport" & @CRLF
_SQLite_SQLiteExe($sDbFile, $sIn, $sOut, -1, True)

If @error = 0 Then
	; Zeigt Tabelle (mittels SQLite3.dll)
	Local $iRows, $iColumns, $aRes
	_SQLite_Startup()
	ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
	_SQLite_Open($sDbFile)
	_SQLite_GetTable2D(-1, "SELECT ROWID,* FROM TblImport;", $aRes, $iRows, $iColumns)
	_SQLite_Display2DResult($aRes) ; Ausgabe in die Konsole
	_SQLite_Close()
	_SQLite_Shutdown()
Else
	If @error = 2 Then
		ConsoleWrite("Fehler: Sqlite3.exe nicht gefunden!" & @CRLF)
	Else
		ConsoleWrite("Fehler: @error=" & @error & " beim Aufruf von _SQLite_SQLiteExe" & @CRLF)
	EndIf
EndIf

; Entferne temporäre Dateien
FileDelete($sTsvFile)
FileDelete($sDbFile)

;~ Ausgabe:
;~ 	rowid  Spalte_1  Spalte_2  Spalte_3
;~ 	1      a         b         c
;~ 	2      a1        b1        c1
;~ 	3      a2        b2        c2



Func _StringCountOccurance($sSearchString, $sSubString, $iCaseSense = $STR_NOCASESENSE) ; Gibt die Anzahl gefundener $sSubString in $sSearchString zurück
	Local $iOccCnt = 1
	Do
		If StringInStr($sSearchString, $sSubString, $iCaseSense, $iOccCnt) > 0 Then
			$iOccCnt += 1
		Else
			ExitLoop
		EndIf
	Until 0
	Return $iOccCnt - 1
EndFunc   ;==>_StringCountOccurance
