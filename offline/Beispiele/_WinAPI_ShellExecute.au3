#include <MsgBoxConstants.au3>
#include <WinAPIShellEx.au3>

Local $sFile = InputBox('Run', 'Hier den Namen eines Programms, Ordners, Dokuments oder Internetadresse eingeben welcher geladen werden soll', '', '', 368, 152)

If $sFile Then
	_WinAPI_ShellExecute($sFile, '', '', 'open')
	If @error Then
		Local $iError = @error
		Local $iExtended = @extended
		MsgBox(($MB_ICONERROR + $MB_SYSTEMMODAL), 'Fehler = ' & $iError, 'Öffnen fehlgeschlagen "' & $sFile & '".' & @CRLF & @CRLF & _WinAPI_GetErrorMessage($iExtended))
	EndIf
EndIf
