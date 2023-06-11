#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Zeigt die aktuelle Arbeitsverzeichnis.
	MsgBox($MB_SYSTEMMODAL, "", "Das aktuelle Arbeitsverzeichnis lautet: " & @CRLF & @WorkingDir)

	; Setzt das Arbeitsverzeichnis @WorkingDir auf das @WindowsDir Verzeichnis. Dies ist normalerweise C:\Windows.
	FileChangeDir(@WindowsDir)

	; Zeigt das Arbeitsverzeichnis nachdem dieses auf das Windows-Verzeichnis geändert wurde.
	MsgBox($MB_SYSTEMMODAL, "", "Das aktuelle Arbeitsverzeichnis lautet: " & @CRLF & @WorkingDir)
EndFunc   ;==>Example
