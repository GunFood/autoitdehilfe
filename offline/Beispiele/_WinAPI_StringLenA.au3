#include <MsgBoxConstants.au3>
#include <WinAPIMisc.au3>

_Example()

Func _Example()
	; Erstellt den String-Buffer mit der Größe 64 als char-Struct
	Local $tStringBuffer = DllStructCreate("char Data[64]")
	; Den Buffer mit Daten füllen
	DllStructSetData($tStringBuffer, "Data", "AutoIt")

	MsgBox($MB_SYSTEMMODAL, "_WinAPI_StringLenA", "Die Länge des String-Buffers beträgt " & _WinAPI_StringLenA($tStringBuffer) & " Zeichen.")
EndFunc   ;==>_Example
