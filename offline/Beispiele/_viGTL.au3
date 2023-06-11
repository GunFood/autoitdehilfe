; Hier nehmen wir an, dass das Gerät an die GPIB-Adresse 3 gesetzt ist.
; Wenn das Gerät an eine andere Adresse gesetzt wurde, muss "GPIB::3::0" entsprechend angepasst werden.
; Es zeigt die Benutzung der Funktion _viGTL mit einem VISA-Descriptor und mit einem VISA-Gerätehandle
; Vorher haben wir mit _viExecCommand in den Fernsteuerungsmodus gewechselt

#include <MsgBoxConstants.au3>
#include <Visa.au3>

Local $h_Session = 0

; Die ID des Geräts an GPIB-Adresse 3 abfragen
MsgBox($MB_SYSTEMMODAL, "Schritt 1", "Einfache GPIB-Abfrage mit einem VISA-Descriptor")
Local $s_Answer = _viExecCommand("GPIB::3::0", "*IDN?", 10000) ; 10 Sekunden Timeout
MsgBox($MB_SYSTEMMODAL, "Ergebnis der GPIB-Abfrage", $s_Answer) ; Antwort anzeigen

; Zum lokalen Computer wechseln (beendet den Fernsteuerungsmodus)
MsgBox($MB_SYSTEMMODAL, "Schritt 2", "Wechsle nach LOCAL unter Verwendung des VISA-Descriptors")
_viGTL("GPIB::1::0")

; Öffnen der Geräteverbindung nur durch Verwenden der Adress-Nummer
MsgBox($MB_SYSTEMMODAL, "Schritt 3", "Öffnen der Geräteverbindung durch Verwenden der Adress-Nummer")
Local $h_Instr = _viOpen(3)
MsgBox($MB_SYSTEMMODAL, "Geräte-Handle bekommen", "$h_Instr = " & $h_Instr) ; Zeigt das Session Handle

; Das Gerät abfragen
MsgBox($MB_SYSTEMMODAL, "Schritt 4", "Das Gerät unter Nutzung des VISA-Gerätehandles abfragen")
$s_Answer = _viExecCommand($h_Instr, "*IDN?") ; $h_Instr ist zu diesem Zeitpunkt KEIN STRING!
MsgBox($MB_SYSTEMMODAL, "Ergebnis der GPIB-Abfrage", $s_Answer) ; Antwort anzeigen

; Noch einmal abfragen. Es ist nicht nötig, den Link erneut zu ÖFFNEN
MsgBox($MB_SYSTEMMODAL, "Schritt 5", "Noch einmal abfragen. Es ist nicht nötig, den Link erneut zu ÖFFNEN")
$s_Answer = _viExecCommand($h_Instr, "*IDN?")
MsgBox($MB_SYSTEMMODAL, "Ergebnis der GPIB-Abfrage", $s_Answer) ; Antwort anzeigen

; Wechselt zum lokalen Computer (optional)
MsgBox($MB_SYSTEMMODAL, "Schritt 6", "Wechsle nach LOCAL unter Verwendung des VISA-Gerätehandles")
_viGTL($h_Instr)

; Geräteverbindung schließen
MsgBox($MB_SYSTEMMODAL, "Schritt 7", "Schließen der Geräteverbindung mit _viClose")
_viClose($h_Instr)
