#include <File.au3>
#include <MsgBoxConstants.au3>
#include <SQLite.au3>
#include <SQLite.dll.au3>

_SQLite_Startup()
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Error", "SQLite3.dll kann nicht geladen werden!")
	Exit -1
EndIf
ConsoleWrite("_SQLite_LibVersion=" & _SQLite_LibVersion() & @CRLF)

_SQLite_Open() ; Erstellt eine :memory: Datenbank im Arbeitsspeicher ohne ihr Handle zu verwenden
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Error", "Kann keine Datenbank im Speicher erstellen!")
	Exit -1
EndIf
_SQLite_Close()

Local $hMemDb = _SQLite_Open() ; Erstellt eine :memory: Datenbank im Arbeitsspeicher
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Error", "Kann keine Datenbank im Speicher erstellen!")
	Exit -1
EndIf

Local $hTmpDb = _SQLite_Open('') ; Erstellt eine temporäre Datenbank auf der Festplatte
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Error", "Kann keine temporäre Datenbank erstellen!")
	Exit -1
EndIf

Local $sDbName = _TempFile()
Local $hDskDb = _SQLite_Open($sDbName) ; Erstellt eine permanente Datenbank auf der Festplatten
If @error Then
	MsgBox($MB_SYSTEMMODAL, "SQLite Error", "Kann keine permanente Datenbank erstellen!")
	Exit -1
EndIf

; Es ist auch möglich die 3 Datenbanken nach Bedarf über ihr Handle zu benutzen

; Schließt die erstellten Datenbanken, in beliebiger Reihenfolge
_SQLite_Close($hTmpDb) ; Temporäre Datenbanken werden automatisch durch Close gelöscht
_SQLite_Close($hDskDb) ; Die Datenbank ist eine gewöhnliche Datei die jederzeit wieder geöffnet werden kann
_SQLite_Close($hMemDb)

; Diese Datenbank wird nicht mehr gebraucht
FileDelete($sDbName)

_SQLite_Shutdown()
