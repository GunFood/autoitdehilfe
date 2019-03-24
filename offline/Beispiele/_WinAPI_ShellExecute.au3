#include <MsgBoxConstants.au3>
#include <WinAPIShellEx.au3>

Local $sFile = InputBox('Run', 'Hier den Namen eines Programms, Ordners, Dokuments oder Internetadresse eingeben welcher geladen werden soll', '', '', 368, 152)

If $sFile Then
	_WinAPI_ShellExecute($sFile, '', '', 'open')
	If @error Then
		MsgBox(BitOR($MB_ICONERROR, $MB_SYSTEMMODAL), 'Fehler', 'Öffnen fehlgeschlagen "' & $sFile & '".' & @CRLF & @CRLF & @extended)
	EndIf
EndIf
