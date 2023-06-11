#include <WinAPIFiles.au3>

Local $aDrive = DriveGetDrive('CDROM')

If IsArray($aDrive) Then
	ConsoleWrite('Öffnen...' & @CRLF)
	_WinAPI_EjectMedia($aDrive[1])
	ConsoleWrite('Lade ist geöffnet: ' & _WinAPI_IsDoorOpen($aDrive[1]) & @CRLF)
	Sleep(1000)
	ConsoleWrite('Schließen...' & @CRLF)
	_WinAPI_LoadMedia($aDrive[1])
	ConsoleWrite('Lade ist geöffnet: ' & _WinAPI_IsDoorOpen($aDrive[1]) & @CRLF)
EndIf
