#include <WinAPI.au3>
Run("Notepad") ; Notepad starten
$hWnd = WinWait("[CLASS:Notepad]") ; Auf Fenster warten.

$tRect = _WinAPI_GetWindowRect($hWnd) ; Struct mit Koordinaten auslesen
; Siehe $tagRECT in der Schlüsselwort-Referenz.

MsgBox(0, "Beispiel", _
		WinGetTitle($hWnd) & ":" & @CRLF & _
		DllStructGetData($tRect, "Left") & @CRLF & _ ; Daten ausgeben
		DllStructGetData($tRect, "Top") & @CRLF & _
		DllStructGetData($tRect, "Right") & @CRLF & _
		DllStructGetData($tRect, "Bottom") & @CRLF _
		)