#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Weist einer lokalen Konstante die Definition der Struktur zu.
	Local Const $tagSTRUCT1 = "struct;int var1;byte var2;uint var3;char var4[128];endstruct"

	; Weist einer lokalen Variable die Struktur zu.
	Local $tSTRUCT1 = DllStructCreate($tagSTRUCT1)

	; Wenn ein Fehler aufgetaucht ist, so wird dieser angezeigt und False zurückgegeben.
	If @error Then
		MsgBox($MB_SYSTEMMODAL, "", "Error in DllStructCreate, Code: " & @error)
		Return False
	EndIf

	#cs Kommentare:
	-Die standardmäßige Ausrichtung für die Daten sind 4 Bytes. Das bedeutet, dass jedes Element mindestens 4 Bytes benötigt.
	-Die minimale Größe erhalten werden wenn man am Anfang der Struct-Definition eine Ausrichtung (alignment) von 1 angibt: "align 1;struct; ..."

	-Detaillierte Informationen über die Structgröße:
	var1: int - 4 bytes
	var2: byte - 1 byte + 3 bytes Ausrichtung = 4 bytes
	var3: uint - 4 bytes
	var4: char[128] - 1 * 128 bytes
	#ce

	MsgBox($MB_SYSTEMMODAL, "", "Größe des Structs: " & DllStructGetSize($tSTRUCT1))
EndFunc   ;==>Example
