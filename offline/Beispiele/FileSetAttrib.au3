#include <FileConstants.au3>
#include <MsgBoxConstants.au3>

If MsgBox(BitOR($MB_YESNO, $MB_SYSTEMMODAL), "", "Bitte beachten: Dies ist ein Beispiel und sollte unter normalen Umständen nicht laufen. " & @CRLF & @CRLF & "Wollen Sie das Beispiel starten?") = $IDYES Then
	; Kennzeichnet alle .au3 Dateien im aktuellen Verzeichnis als nur-lesend und System
	If Not FileSetAttrib(@ScriptDir & "\*.au3", "+RS") Then
		MsgBox($MB_SYSTEMMODAL, "Fehler", "Die Attribute konnten nicht gesetzt werden.")
	EndIf

	; Kennzeichnet alle .bmp Dateien in @HomeDrive und Unterverzeichnissen als schreibbar und macht sie archivierbar
	If Not FileSetAttrib(@HomeDrive & "\*.bmp", "-R+A", $FT_RECURSIVE) Then
		MsgBox($MB_SYSTEMMODAL, "Fehler", "Die Attribute konnten nicht gesetzt werden.")
	EndIf

EndIf
