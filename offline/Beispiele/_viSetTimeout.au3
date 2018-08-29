; Hier nehmen wir an, dass das Gerät an die GPIB-Adresse 3 gesetzt ist.
; Wenn man ein Geräte in einer anderen Adresse hat, so ist "GPIB::3::0" auf die
; Entsprechende Beschreibung zu ändern. Das gleiche ist für den Aufruf zu _viOpen erledigen.
; Es zeigt wie man die _viExecCommand Funktion mit einem Timeout verwendet oder wie man stattdessen _viSetTimeout aufruft.

#include <MsgBoxConstants.au3>
#include <Visa.au3>

Local $h_Session = 0

; Die ID des Geräts an GPIB-Adresse 3 abfragen
MsgBox($MB_SYSTEMMODAL, "Schritt 1", "Einfache GPIB Abfrage mit einem explizit gesetzten TIMEOUT")
Local $s_Answer = _viExecCommand("GPIB::3::0", "*IDN?", 10000) ; 10 Sekunden Timeout
MsgBox($MB_SYSTEMMODAL, "GPIB QUERY Ergebnis", $s_Answer) ; Antwort anzeigen

; Dies ist das gleiche wie wenn man zuerst du _viSetTimeout Funktion nutzen würde:
MsgBox($MB_SYSTEMMODAL, "Schritt 2", "_vOpen + Timeout durch Verwenden der _viSetTimeout + GPIB Abfrage")
Local $h_Instr = _viOpen(3)
_viSetTimeout($h_Instr, 10000) ; 10000 ms = 10 s
$s_Answer = _viExecCommand($h_Instr, "*IDN?") ; Der Timeout muss nun nicht gesetzt werden
MsgBox($MB_SYSTEMMODAL, "GPIB QUERY Ergebnis", $s_Answer) ; Antwort anzeigen

MsgBox($MB_SYSTEMMODAL, "Schritt 3", "Schließt die Geräteverbindung durch Verwenden von _viClose")
_viClose($h_Instr) ; Schließt die Geräteverbindung
