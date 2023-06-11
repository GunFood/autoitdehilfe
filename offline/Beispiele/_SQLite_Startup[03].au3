; öffnet SQLite mit einer festgelegten lokalen Datei

#include <MsgBoxConstants.au3>
#include <SQLite.au3>

Local $sLocalSQLiteDll = "lokale SQLite.dll" ; muss in eine existierende .dll geändert werden, da sonst ein Fehler auftritt

Local $sSQliteDll = _SQLite_Startup($sLocalSQLiteDll, False, 1)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", "SQLite3.dll konnte nicht geladen werden!")
	Exit -1
EndIf

MsgBox($MB_SYSTEMMODAL, "SQLite3.dll gealden", $sSQliteDll & " (" & _SQLite_LibVersion() & ")")
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
_SQLite_Shutdown()
