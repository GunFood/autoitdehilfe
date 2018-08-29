#include <Crypt.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Erstellt 16 Bytes mit verschiedenen Daten
	Local $tBuff = DllStructCreate("byte[16]")
	_Crypt_GenRandom($tBuff, DllStructGetSize($tBuff))
	MsgBox($MB_SYSTEMMODAL, "Verschiedene Daten:", DllStructGetData($tBuff, 1))
EndFunc   ;==>Example
