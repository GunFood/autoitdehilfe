#include <MsgBoxConstants.au3>

;=========================================================
;	Erzeugen der Struktur
;	struct {
;		int				var1;
;		unsigned char	var2;
;		unsigned int	var3;
;		char			var4[128];
;	}
;=========================================================
Local $str = "int var1;ubyte var2;uint var3;char var4[128]"
Local $a = DllStructCreate($str)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "", "Fehler in DllStructCreate " & @error);
	Exit
EndIf

;=========================================================
;	Daten in Struktur setzen
;	struct.var1	= -1;
;	struct.var2	= 255;
;	struct.var3	= INT_MAX; -1 wird per typecast zu (unsigned int)
;	strcpy(struct.var4,"Hallo");
;	struct.var4[0]	= 'h';
;=========================================================
DllStructSetData($a, "var1", -1)
DllStructSetData($a, "var2", 255)
DllStructSetData($a, "var3", -1)
DllStructSetData($a, "var4", "Hallo")
DllStructSetData($a, "var4", Asc("h"), 1)

;=========================================================
;	Struktur-Info anzeigen
;=========================================================
MsgBox($MB_SYSTEMMODAL, "DllStruct", "Strukturgröße: " & DllStructGetSize($a) & @CRLF & _
		"Strukturzeiger: " & DllStructGetPtr($a) & @CRLF & _
		"Daten:" & @CRLF & _
		DllStructGetData($a, 1) & @CRLF & _
		DllStructGetData($a, 2) & @CRLF & _
		DllStructGetData($a, 3) & @CRLF & _
		DllStructGetData($a, 4))

;=========================================================
;	Den Speicher freigeben den die Struktur belegt hat
;=========================================================
$a = 0
