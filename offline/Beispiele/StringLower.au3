#include <MsgBoxConstants.au3>

Local $sString = StringLower("Dies ist ein String") ; Wandelt den folgende String in Kleinbuchstaben.
MsgBox($MB_SYSTEMMODAL, "", "StringLower gibt folgendes zurück: " & $sString)
