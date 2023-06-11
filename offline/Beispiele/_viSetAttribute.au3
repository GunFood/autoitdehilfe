; Hier nehmen wir an, dass das Gerät an die GPIB-Adresse 3 gesetzt ist.
; Wenn man ein Gerät in einer anderen Adresse hat, so ist "GPIB::3::0" auf die
; Entsprechende Beschreibung zu ändern. Das Gleiche ist für den Aufruf von _viOpen zu erledigen.
; Es zeigt, wie man _viSetAttribute verwendet. In diesem Beispiel verwenden wir _viSetAttribute
; Anstelle von _viSetTimeout, um den GPIB-Timeout eines _viExecCommand-Vorgangs zu setzen.

#include <MsgBoxConstants.au3>
#include <Visa.au3>

Local $h_Session = 0

; Die ID des Geräts an GPIB-Adresse 3 abfragen
MsgBox($MB_SYSTEMMODAL, "Schritt 1", "Einfache GPIB-Abfrage mit einem explizit gesetzten TIMEOUT")
Local $s_Answer = _viExecCommand("GPIB::3::0", "*IDN?", 10000) ; 10 Sekunden Timeout
MsgBox($MB_SYSTEMMODAL, "GPIB QUERY Ergebnis", $s_Answer) ; Antwort anzeigen

; Dies ist das Gleiche, als wenn man zuerst die _viSetTimeout-Funktion nutzen würde:
MsgBox($MB_SYSTEMMODAL, "Schritt 2", "_vOpen + Timeout durch Verwenden der _viSetTimeout + GPIB Abfrage")
Local $h_Instr = _viOpen(3)
; Folgendes ist zu beachten - Dies ist das Gleiche wie: _viSetTimeout($h_Instr, 10000)
_viSetAttribute($h_Instr, $VI_ATTR_TMO_VALUE, 10000) ; 10000 ms = 10 s

$s_Answer = _viExecCommand($h_Instr, "*IDN?") ; Der Timeout muss nun nicht gesetzt werden
MsgBox($MB_SYSTEMMODAL, "GPIB QUERY Ergebnis", $s_Answer) ; Antwort anzeigen

MsgBox($MB_SYSTEMMODAL, "Schritt 3", "Schließt die Geräteverbindung durch Verwenden von _viClose")
_viClose($h_Instr) ; Schließt die Geräteverbindung
