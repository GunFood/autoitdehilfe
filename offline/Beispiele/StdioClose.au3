#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
#include <Array.au3> ; wird für nur für _ArrayDisplay benötigt.

; Zeigt rekursiv die Dateien innerhalb eines Verzeichnisses an.
Example()

Func Example()
	Local $sFilePath = @ScriptDir ; Durchsucht das aktuelle Skriptverzeichnis
	Local $sFilter = "*.*" ; Sucht nach allen Dateien im aktuellen Verzeichnis. Für eine Liste von erlaubten Platzhaltern (Wildcards) durchsucht die Hilfe-Datei nach 'Wildcards'.
	Local $sOutput = "" ; Speichert die Ausgabe von StdoutRead in eine Variable

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

	; Schließt den Stdio Stream mit der Prozess-ID (PID) welche von Run zurückgegeben wurde. Dies wird die Message Box anzeigen, da der Stdout Stream nicht gelesen werden kann.
	StdioClose($iPID)

	While 1
		$sOutput &= StdoutRead($iPID) ; Liest den Stdout Stream mit der Prozess-ID welche von Run zurückgegeben wurde.
		If @error Then ; Springt aus der Schleife wenn der Prozess schließt oder StdoutRead einen Fehler zurückgibt.
			ExitLoop
		EndIf
	WEnd

	; Verwendet StringSplit um die Ausgabe von StdoutRead in ein Array zu teilen. Alle Wagenrückläufe (@CRLF) werden entfernt und @CRLF (Zeilenvorschub) wird als Trennzeichen verwendet.
	Local $aArray = StringSplit(StringTrimRight(StringStripCR($sOutput), StringLen(@LF)), @LF)
	If @error Then
		MsgBox($MB_SYSTEMMODAL, "", "Es sieht so aus als ob es einen Fehler gab während der Suche nach allen Dateien im aktuellen Verzeichnis.")
	Else
		; Zeigt die Ergebnisse an.
		_ArrayDisplay($aArray)
	EndIf
EndFunc   ;==>Example
