; Hier nehmen wir an, dass das Gerät an die GPIB-Adresse 1 gesetzt ist
; Es zeigt, wie die Funktion _viExecCommand allein und in Kombination mit _viOpen und _viClose zu benutzen ist.
; Es zeigt außerdem die Funktion _viGTL

#include <MsgBoxConstants.au3>
#include <Visa.au3>

Local $h_Session = 0

; Die ID des Geräts an GPIB-Adresse 3 abfragen
MsgBox($MB_SYSTEMMODAL, "Schritt 1", "Öffnen der Geräteverbindung mit _viOpen")
Local $h_Instr = _viOpen("GPIB::3::0")
MsgBox($MB_SYSTEMMODAL, "Geräte-Handle bekommen", "$h_Instr = " & $h_Instr) ; Sitzungshandle anzeigen
; Das Gerät abfragen

MsgBox($MB_SYSTEMMODAL, "Schritt 2", "Das Gerät unter Nutzung des VISA-Gerätehandles abfragen ")
Local $s_Answer = _viExecCommand($h_Instr, "*IDN?") ; $h_Instr ist zu diesem Zeitpunkt KEIN STRING!
MsgBox($MB_SYSTEMMODAL, "GPIB QUERY Ergebnis", $s_Answer) ; Antwort anzeigen
; Noch einmal abfragen. Es ist nicht nötig, den Link erneut zu ÖFFNEN

MsgBox($MB_SYSTEMMODAL, "Schritt 3", "Noch einmal abfragen. Es ist nicht nötig, den Link erneut zu ÖFFNEN")
$s_Answer = _viExecCommand($h_Instr, "*IDN?")
MsgBox($MB_SYSTEMMODAL, "GPIB QUERY Ergebnis", $s_Answer) ; Antwort anzeigen

MsgBox($MB_SYSTEMMODAL, "Schritt 4", "Schließen der Geräteverbindung mit _viClose")
_viClose($h_Instr) ; Geräteverbindung schließen

MsgBox($MB_SYSTEMMODAL, "Schritt 5", "Öffnen der Geräteverbindung nur durch Verwenden der Adress-Nummer")
Local $h_Instr = _viOpen(3)
MsgBox($MB_SYSTEMMODAL, "Geräte-Handle bekommen", "$h_Instr = " & $h_Instr) ; Zeigt das Session Handle
; Das Gerät abfragen

MsgBox($MB_SYSTEMMODAL, "Schritt 6", "Abfrage der Geräteverbindung durch Verwenden des VISA Gerätehandles")
$s_Answer = _viExecCommand($h_Instr, "*IDN?") ; $h_Instr ist zu diesem Zeitpunkt KEIN STRING!
MsgBox($MB_SYSTEMMODAL, "GPIB QUERY Ergebnis", $s_Answer) ; Antwort anzeigen
; Noch einmal abfragen. Es ist nicht nötig, den Link erneut zu ÖFFNEN

MsgBox($MB_SYSTEMMODAL, "Schritt 7", "Noch einmal abfragen. Es ist nicht nötig, den Link erneut zu ÖFFNEN")
$s_Answer = _viExecCommand($h_Instr, "*IDN?")
MsgBox($MB_SYSTEMMODAL, "GPIB QUERY Ergebnis", $s_Answer) ; Antwort anzeigen

MsgBox($MB_SYSTEMMODAL, "Schritt 8", "Schließt die Geräteverbindung durch Verwenden von _viClose")
_viClose($h_Instr) ; Schließt die Geräteverbindung
