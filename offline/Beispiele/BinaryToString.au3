#include <MsgBoxConstants.au3>
#include <StringConstants.au3>

Example()

Func Example()
	; Definiert den String der später konvertiert wird.
	; Anmerkung: Dieser String könnte in der Hilfe Datei und sogar in manchen Texteditoren als ?? dargestellt werden.
	; Dieses Beispiel wurde als UTF-8 mit BOM gespeichert.
	; Es sollte in Editoren die auf BOM Basis veränderbare Codeseiten unterstützen korrekt angezeigt werden.
	Local Const $sString = "Hallo - ??"

	; Temporäre Variablen in denen die Konvertierungsresultate gespeichert werden.
	; $dBinary wird den Originalstring in Binärform enthalten und
	; $sConverted wird das Resultat enthalten nachdem es in das ursprüngliche Format gebracht wurde
	Local $dBinary = Binary(""), $sConverted = ""

	; Konvertiert den originalen UTF-8 String in einen ANSI kompatiblen Binärstring.
	$dBinary = StringToBinary($sString)

	; Konvertiert den ANSI kompatiblen Binärstring zurück in einen String.
	$sConverted = BinaryToString($dBinary)

	; Zeigt die Ergebnisse. Die letzten beiden Zeichen werden als ?? dargestellt, da sie in ANSI nicht repräsentiert werden können.
	DisplayResults($sString, $dBinary, $sConverted, "ANSI")

	; Konvertiert den originalen UTF-8 String in einen UTF16-LE Binärstring.
	$dBinary = StringToBinary($sString, $SB_UTF16LE)

	; Konvertiert den UTF16-LE Binärstring zurück in einen String.
	$sConverted = BinaryToString($dBinary, $SB_UTF16LE)

	; Zeigt die Ergebnisse.
	DisplayResults($sString, $dBinary, $sConverted, "UTF16-LE")

	; Konvertiert den originalen UTF-8 String in einen UTF16-LE Binärstring.
	$dBinary = StringToBinary($sString, $SB_UTF16BE)

	; Konvertiert den UTF16-LE Binärstring zurück in einen String.
	$sConverted = BinaryToString($dBinary, $SB_UTF16BE)

	; Zeigt die Ergebnisse.
	DisplayResults($sString, $dBinary, $sConverted, "UTF16-BE")

	; Konvertiert den originalen UTF-8 String in einen UTF-8 Binärstring.
	$dBinary = StringToBinary($sString, $SB_UTF8)

	; Konvertiert den UTF-8 Binärstring zurück in einen String.
	$sConverted = BinaryToString($dBinary, $SB_UTF8)

	; Zeigt die Ergebnisse.
	DisplayResults($sString, $dBinary, $sConverted, "UTF8")
EndFunc   ;==>Example

; Hilfsfunktion welche die Nachricht für die Darstellung formatiert. Sie empfängt folgende Parameter:
; $sOriginal - Der originale String vor der Konvertierung.
; $dBinary - Der originale String nachdem er in Binärform konvertiert wurde.
; $sConverted - Der originale String nachdem er in Binärform und zurück konvertiert wurde.
; $sConversionType - Ein für den Benutzer lesbarer Name für den bei der konvertierung verwendeten Kodierungstyp.
Func DisplayResults($sOriginal, $dBinary, $sConverted, $sConversionType)
	MsgBox($MB_SYSTEMMODAL, "", "Original:" & @CRLF & $sOriginal & @CRLF & @CRLF & "Binär:" & @CRLF & $dBinary & @CRLF & @CRLF & $sConversionType & ":" & @CRLF & $sConverted)
EndFunc   ;==>DisplayResults
