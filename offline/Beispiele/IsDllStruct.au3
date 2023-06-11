#include <MsgBoxConstants.au3>

Local $tStruct = DllStructCreate("wchar[256]")
If IsDllStruct($tStruct) Then
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable ist eine dll Struktur")
Else
	MsgBox($MB_SYSTEMMODAL, "", "Die Variable ist keine dll Struktur")
EndIf
