#include <Array.au3>
#include <Debug.au3>
#include <MsgBoxConstants.au3>
#include <SQLite.au3>
#include <SQLite.dll.au3>

Example()

Func Example()
	Local $aResult, $iRows, $iColumns, $iRval, $sText, $aArrayFromText

	_SQLite_Startup()
	If @error Then
		MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", "SQLite.dll konnte nicht geladen werden!")
		Exit -1
	EndIf
	ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)

	_SQLite_Open() ; Öffnet eine :memory: Datenbank
	If @error Then
		MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", "Datenbank konnte nicht geladen werden!")
		Exit -1
	EndIf

	; BeispielTabelle
	; Name        | Alter
	; -----------------------
	; Alice       | 43
	; Bob         | 28
	; Cindy       | 21

	If Not _SQLite_Exec(-1, "CREATE TEMP TABLE persons (Name, Age);" & _
			"INSERT INTO persons VALUES ('Alice','43');" & _
			"INSERT INTO persons VALUES ('Bob','28');" & _
			"INSERT INTO persons VALUES ('Cindy','21');") = $SQLITE_OK Then _
			MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", _SQLite_ErrMsg())

	; Abfrage
	$iRval = _SQLite_GetTable2D(-1, "SELECT * FROM persons;", $aResult, $iRows, $iColumns)
	If $iRval = $SQLITE_OK Then

		ConsoleWrite('--- --- --- ---' & @CRLF)
		_SQLite_Display2DResult($aResult)
		ConsoleWrite('--- --- --- ---' & @CRLF)

		; Demo unter Verwendung von _SQLite_Display2DResult()
		$sText = _SQLite_Display2DResult($aResult, Default, True, @TAB)
		ConsoleWrite($sText & @CRLF) ; in eine Protokolldatei speichern...
		$aArrayFromText = _ArrayFromString($sText, @TAB) ; ... dann das Array neu aufbauen
		_DebugArrayDisplay($aArrayFromText, "from _SQLite_Display2DResult()")
		ConsoleWrite('--- --- --- ---' & @CRLF)

		; Demo unter Verwendung von _ArrayToString()
		$sText = _ArrayToString($aResult)
		ConsoleWrite($sText & @CRLF)
		$aArrayFromText = _ArrayFromString($sText)
		_DebugArrayDisplay($aArrayFromText, "from _ArrayToString()")
		ConsoleWrite('--- --- --- ---' & @CRLF)

	Else
		MsgBox($MB_SYSTEMMODAL, "SQLite Fehler: " & $iRval, _SQLite_ErrMsg())
	EndIf

	_SQLite_Close()
	_SQLite_Shutdown()
EndFunc   ;==>Example
