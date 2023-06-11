#include <WinAPIFiles.au3>
#include <WinAPIHObj.au3>

Global $sTempFile, $hFile, $sText, $nBytes, $tBuffer, $iSize

; 1) Erstellt eine Datei und schreibt Daten hinein
$sTempFile = @ScriptDir & '\test.txt'
$sText = 'abcdefghijklmnopqrstuvwxyz'
$tBuffer = DllStructCreate("byte[" & StringLen($sText) & "]")
DllStructSetData($tBuffer, 1, $sText)
$hFile = _WinAPI_CreateFile($sTempFile, 1)
_WinAPI_WriteFile($hFile, DllStructGetPtr($tBuffer), StringLen($sText), $nBytes)
$iSize = _WinAPI_GetFileSizeEx($hFile)
_WinAPI_CloseHandle($hFile)
; Ausgabe in die Konsole
ConsoleWrite('1):' & $iSize & ' ' & FileRead($sTempFile) & @CRLF)

; 2) liest 6 Bytes ab Position 3
$tBuffer = DllStructCreate("byte[6]")
$hFile = _WinAPI_CreateFile($sTempFile, 2, 2)
$iSize = _WinAPI_GetFileSizeEx($hFile)
_WinAPI_SetFilePointer($hFile, 3)
_WinAPI_ReadFile($hFile, DllStructGetPtr($tBuffer), 6, $nBytes)
_WinAPI_CloseHandle($hFile)
$sText = BinaryToString(DllStructGetData($tBuffer, 1))
; Ausgabe in die Konsole
ConsoleWrite('2):' & $iSize & ' ' & $sText & @CRLF)

; 3) Schreibt die vorher gelesenen 6 Bytes an die gleiche Position, aber in Großbuchstaben
DllStructSetData($tBuffer, 1, StringUpper($sText))
$hFile = _WinAPI_CreateFile($sTempFile, 2, 4)
$iSize = _WinAPI_GetFileSizeEx($hFile)
_WinAPI_SetFilePointer($hFile, 3)
_WinAPI_WriteFile($hFile, DllStructGetPtr($tBuffer), 6, $nBytes)
_WinAPI_CloseHandle($hFile)
$tBuffer = 0
; Ausgabe in die Konsole
ConsoleWrite('3):' & $iSize & ' ' & FileRead($sTempFile) & @CRLF)

; 4) kürze die Dateigröße auf 12 Bytes
$hFile = _WinAPI_CreateFile($sTempFile, 2, 4)
_WinAPI_SetFilePointer($hFile, 12)
_WinAPI_SetEndOfFile($hFile)
$iSize = _WinAPI_GetFileSizeEx($hFile)
_WinAPI_CloseHandle($hFile)
; Ausgabe in die Konsole
ConsoleWrite('4):' & $iSize & ' ' & FileRead($sTempFile) & @CRLF)

FileDelete($sTempFile)
