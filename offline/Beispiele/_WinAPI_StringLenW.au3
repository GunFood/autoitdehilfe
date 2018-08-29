#include <MsgBoxConstants.au3>
#include <WinAPIMisc.au3>

; Erstellt den String-Buffer mit der Größe 64 als wchar-Struct
Local $tStringBuffer = DllStructCreate("wchar Data[64]")
; Den Buffer mit Daten füllen
DllStructSetData($tStringBuffer, "Data", "Gongoozle")

MsgBox($MB_SYSTEMMODAL, "_WinAPI_StringLenW", "Die Länge des String-Buffers beträgt " & _WinAPI_StringLenW($tStringBuffer) & " Zeichen.")
