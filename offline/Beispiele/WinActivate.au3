#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Startet den Editor
	Run("notepad.exe")

	; Prüft, ob das Fenster aktiviert ist und zeigt das Ergebnis an.
	If WinActivate("[CLASS:Notepad]", "") Then
		MsgBox($MB_SYSTEMMODAL + $MB_ICONWARNING, "Warnung", "Das Fenster wurde aktiviert" & @CRLF & @CRLF & "Vielleicht ist das System sehr schnell.")
	Else
		; Der Editor wird dargestellt, da die MsgBox durch deren Verzägerung dies erlaubt.
		MsgBox($MB_SYSTEMMODAL, "", "Das Fenster wurde aktiviert" & @CRLF & @CRLF & "Aber der Editor befindet sich im Hintergrund wegen der MsgBox.", 5)
	EndIf

	; Prüft erneut, ob das Fenster aktiviert ist und zeigt das Ergebnis an.
	If WinActivate("[CLASS:Notepad]", "") Then
		MsgBox($MB_SYSTEMMODAL, "", "Das Fenster ist NUN aktiviert")
	Else
		MsgBox($MB_SYSTEMMODAL + $MB_ICONERROR, "Fehler", "Das Fenster ist nicht aktiviert")
	EndIf

	; Schließt das Editor-Fenster durch die Verwnedung des von WinWait zurückgegebenen Handles.
	WinClose("[CLASS:Notepad]", "")
EndFunc   ;==>Example
