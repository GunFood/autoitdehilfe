#include <MsgBoxConstants.au3>

Example()

Func Example()
	#cs Comments:
		Erstellen Sie die folgende Struktur (C-Sprache)::
		struct {
			int var1;
			unsigned char var2;
			unsigned int var3;
			char var4[128];
		};

		Schema:
		------------------------------------
		\ int    \ byte   \ uint   \ char   \
		 \   var1 \   var2 \   var3 \   var4 \
		  ------------------------------------
	#ce Comments:

	; Weist einer lokalen konstanten Variablen die Definition einer Struktur zu (man sollte die Bemerkungen zu DllStructCreate sorgfältig durchlesen).
	Local Const $tagSTRUCT1 = "struct;int var1;byte var2;uint var3;char var4[128];endstruct"

	; Hinweis: Die Tag-Variable wird als Konstante deklariert, da sich ihr Wert bei keiner Skriptausführung ändern wird.

	; Weist der Struktur eine lokale Variable zu.
	Local $tSTRUCT1 = DllStructCreate($tagSTRUCT1)

	; Wenn ein Fehler aufgetreten ist, den Fehlercode anzeigen und False zurückgeben.
	If @error Then
		MsgBox($MB_SYSTEMMODAL, "", "Error in DllStructCreate, Code: " & @error)
		Return False
	EndIf

	; Setzt die Daten des Elements var1 (int) in $tSTRUCT1.
	DllStructSetData($tSTRUCT1, "var1", -1) ; Oder 1 statt „var1“.

	; Setz die Daten des Elements var2 (Byte) in $tSTRUCT1.
	DllStructSetData($tSTRUCT1, 2, 255) ; Oder „var2“ anstelle von 2.

	; Setzt die Daten des Elements var3 (uint) in $tSTRUCT1.
	DllStructSetData($tSTRUCT1, "var3", -1) ; Der Wert -1 (signed int) wird in unsigned int umgewandelt.
	; Oder 3 statt „var3“.

	; Setzt die Daten des Elements var4 (Zeichen) in $tSTRUCT1.
	DllStructSetData($tSTRUCT1, "var4", "Hallo") ; Oder 4 statt „var4“.

	; Hinweis: Dieses Element kann bis zu 128 Zeichen enthalten.

	; Ändert die Daten des Elements var4 (Zeichen) in $tSTRUCT1 am Index 1 des Zeichen-Arrays (Index beginnt bei 1).
	DllStructSetData($tSTRUCT1, "var4", Asc("h"), 1)

	; Zeigt die Ergebnisse an.
	MsgBox($MB_SYSTEMMODAL, "", "Struct Size: " & DllStructGetSize($tSTRUCT1) & @CRLF & _
			"Struct pointer: " & DllStructGetPtr($tSTRUCT1) & @CRLF & _
			"Data:" & @CRLF & _
			DllStructGetData($tSTRUCT1, 1) & @CRLF & _ ; Oder „var1“ anstelle von 1.
			DllStructGetData($tSTRUCT1, "var2") & @CRLF & _ ; Oder 2 statt „var2“.
			DllStructGetData($tSTRUCT1, 3) & @CRLF & _ ; Oder „var3“ anstelle von 3.
			DllStructGetData($tSTRUCT1, 4)) ; Oder „var4“ anstelle von 4.

	; Gibt die von der Struktur verwendeten Ressourcen frei.
	$tSTRUCT1 = 0
EndFunc   ;==>Example
