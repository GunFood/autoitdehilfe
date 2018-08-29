#include <MsgBoxConstants.au3>

;Den Windows PickIconDlg anzeigen
Local $sFileName = @SystemDir & '\shell32.dll'

; Struktur erzeugen um den Iconindex abzuspeichern
Local $tIconIndex = DllStructCreate("int")
Local $tString = DllStructCreate("wchar[260]")
Local $iStructsize = DllStructGetSize($tString) / 2
DllStructSetData($tString, 1, $sFileName)

; Den PickIconDlg starten - '62' ist der Ordinalwert für diese Funktion
DllCall("shell32.dll", "none", 62, _
		"hwnd", 0, _
		"struct*", $tString, _
		"int", $iStructsize, _
		"struct*", $tIconIndex)

$sFileName = DllStructGetData($tString, 1)
Local $iIconIndex = DllStructGetData($tIconIndex, 1)

; Den neuen Dateinamen und den Iconindex anzeigen
MsgBox($MB_SYSTEMMODAL, "Info", "Die zuletzt ausgewählte Datei: " & $sFileName & @CRLF & "Icon-Index: " & $iIconIndex)
