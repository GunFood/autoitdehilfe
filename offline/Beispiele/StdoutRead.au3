#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
#include <Array.au3> ; wird für nur für _ArrayDisplay benötigt.

; Zeigt rekursiv die Dateien innerhalb eines Verzeichnisses an.
Example()

Func Example()
	Local $sFilePath = @ScriptDir ; Dursucht das aktuelle Skriptverzeichnis
	Local $sFilter = "*.*" ; Sucht nach allen Dateien im aktuellen Verzeichnis. Für eine Liste von erlaubten Platzhaltern (Wildcards) durchsucht die Hilfe-Datei nach 'Wildcards'.

	; Wenn der Dateipfad kein Verzeichnis ist, so wird aus der 'Example'-Funktion gesprungen.
	If Not StringInStr(FileGetAttrib($sFilePath), "D") Then
		Return SetError(1, 0, 0)
	EndIf

	; Entfernt nachfolgende Backslashes und fügt ein einziges Backslash hinzu.
	$sFilePath = StringRegExpReplace($sFilePath, "[\\/]+\z", "") & "\"

	#cs
		Kommandozeilenparameter für DIR:
		/B - Einfache Ausgabe.
		/A-D - Sucht nach allen Dateien und ignoriere Verzeichnisse.
		/S - Sucht innerhalb von Unterverzeichnissen.
	#ce
	Local $iPID = Run(@ComSpec & ' /C DIR "' & $sFilePath & $sFilter & '" /B /A-D /S', $sFilePath, @SW_HIDE, $STDOUT_CHILD)
	; Um nach Dateien zu suchen welche Unicodezeichen enthalten muss der /U Kommandozeilenparameter verwendet werden.

	; Es wird solange gewartet, bis der Prozess mit der Prozess-ID, welche von Run zurückgegeben wurde, beendet ist.
	ProcessWaitClose($iPID)

	; Liest den Stdout Stream der Prozess-ID welche von Run zurückgegeben wurde. Das kann auch in einer while-Schleife geschehen. Siehe dazu das Beispiel für StderrRead.
	Local $sOutput = StdoutRead($iPID)

	; Verwendet StringSplit um die Ausgabe von StdoutRead in ein Array zu teilen. Alle Wagenrückläufe (@CRLF) werden entfernt und @CRLF (Zeilenvorschub) wird als Trennzeichen verwendet.
	Local $aArray = StringSplit(StringTrimRight(StringStripCR($sOutput), StringLen(@CRLF)), @CRLF)
	If @error Then
		MsgBox($MB_SYSTEMMODAL, "", "Es sieht so aus als ob es einen Fehler gab während der Suche nach allen Dateien im aktuellen Verzeichnis.")
	Else
		; Zeigt die Ergebnisse an.
		_ArrayDisplay($aArray)
	EndIf
EndFunc   ;==>Example
