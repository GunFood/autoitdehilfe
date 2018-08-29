#include <MsgBoxConstants.au3>
#include <SQLite.au3>
#include <SQLite.dll.au3>

_SQLite_Startup()
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", "SQLite.dll konnte nicht geladen werden!")
	Exit -1
EndIf
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)
_SQLite_Open() ; Öffne eine :memory: (Nur-im-Speicher) -Datenbank
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Fehler", "Konnte die Datenbank nicht laden!")
	Exit -1
EndIf
_SQLite_Close()
_SQLite_Shutdown()
