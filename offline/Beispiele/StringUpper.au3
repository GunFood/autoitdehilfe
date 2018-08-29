#include <MsgBoxConstants.au3>

Local $sString = StringUpper("Dies ist ein String") ; Wandelt den folgenden String in Großbuchstaben.
MsgBox($MB_SYSTEMMODAL, "", "StringUpper gibt folgendes zurück: " & $sString)
