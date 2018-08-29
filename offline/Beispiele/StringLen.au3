#include <MsgBoxConstants.au3>

; Ermittelt die Länge des Strings.
; Wenn der String nur ASCII Zeichen verwendet, dann ist die Länge gleich der Größe in Bytes. So sind z. B. 10 Zeichen 10 Bytes.
Local $iLength = StringLen("Dies ist ein Satz mit Leerzeichen.")
MsgBox($MB_SYSTEMMODAL, "", "Die Länge des Strings sind " & $iLength & " Zeichen.")
