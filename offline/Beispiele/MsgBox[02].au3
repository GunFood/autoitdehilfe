#include <MsgBoxConstants.au3>

Local $iTimeout = 10

; Zeigt ein Nachrichtenfenster mit Variablen innerhalb des Texts
MsgBox($MB_SYSTEMMODAL, "Titel", "Dieses Nachrichtenfenster wird sich nach " & $iTimeout & " schließen oder wenn der OK-Button gedrückt wurde.", $iTimeout)
