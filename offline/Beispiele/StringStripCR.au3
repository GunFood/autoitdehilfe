#include <MsgBoxConstants.au3>

; Ein String mit Eingabezeichen.
Local $sString = "TDies ist ein Satz " & @CR & "mit " & Chr(13) & "Leerzeichen."

; Entfernt alle Eingabezeichen in dem String.
Local $sStrippedString = StringStripCR($sString)

; Zeigt den String davor und danach.
MsgBox($MB_SYSTEMMODAL, "", "Davor: " & $sString & @CRLF & @CRLF & "Danach: " & $sStrippedString)
