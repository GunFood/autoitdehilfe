#include <WinAPI.au3>
;=========================================================
;   Erstellt die Struktur (Rechteck)
;   unsignierter int    Link;
;   unsignierter int    Oben;
;   unsignierter int    Rechts;
;   unsignierter int    Unten;
;=========================================================
$tRect = DllStructCreate("uint Left;uint Top;uint Right;uint Bottom")
If @error Then
	MsgBox(0, "", "Error in DllStructCreate " & @error);
	Exit
EndIf
;=========================================================
;   Setzt Daten in die Struktur (Rect)
;=========================================================
DllStructSetData($tRect, "Left", 100)
DllStructSetData($tRect, "Top", 100)
DllStructSetData($tRect, "Right", 200)
DllStructSetData($tRect, "Bottom", 200)

;=========================================================
;   Erstellt die Struktur (Point)
;    int             X;
;    int             Y;
;=========================================================
$tPoint = DllStructCreate("int x;int y")
If @error Then
	MsgBox(0, "", "Fehler in DllStructCreate " & @error)
	Exit
EndIf
;=========================================================
;   Setzt Daten in die Struktur (Point)
;=========================================================
DllStructSetData($tPoint, "x", 150)
DllStructSetData($tPoint, "y", 150)

;=========================================================
;   Ruft _WinAPI_PtInRect auf()
;=========================================================
If _WinAPI_PtInRect($tRect, $tPoint) Then
	MsgBox(0, "", "Der Punkt liegt im Rechteck")
Else
	MsgBox(0, "", "Der Punkt liegt nicht im Rechteck")
EndIf