#include <MsgBoxConstants.au3>

; Ermittelt die Zeichenposition an der der String 'weiss' das erste Mal im Satz auftaucht
Local $iPosition = StringInStr("Dies ist ein Satz mit Leerzeichen.", "leer")
MsgBox($MB_SYSTEMMODAL, "", "Die Suchposition des Strings 'leer' taucht zuerst an folgender Position auf: " & $iPosition)
