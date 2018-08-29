#include <MsgBoxConstants.au3>
#include <WinAPIDiag.au3>
#include <WinAPIDlg.au3>
#include <WinAPISys.au3>

If Number(_WinAPI_GetVersion()) < 6.0 Then
	MsgBox(BitOR($MB_ICONERROR, $MB_SYSTEMMODAL), 'Fehler', 'Benötigt Windows Vista oder neuer.')
	Exit
EndIf

If _WinAPI_IsInternetConnected() Then
	ConsoleWrite('Internet ist bereits verbunden.' & @CRLF)
	Exit
EndIf

; Startet den Assistenten zum Herstellen einer Verbindung in der aufrufenden Anwendung, um die Internetverbindung zu aktivieren
_WinAPI_GetConnectedDlg(1, 1 + 4)
