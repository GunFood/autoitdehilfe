#include <WinAPIDlg.au3>

Local $sFile = _WinAPI_SaveFileDlg('', @WorkingDir, 'AutoIt v3 Skripte (*.au3)|Alle Dateiene (*.*)', 1, 'MyScript.au3', '.', BitOR($OFN_PATHMUSTEXIST, $OFN_OVERWRITEPROMPT))

If Not @error Then
	ConsoleWrite($sFile & @CRLF)
EndIf
