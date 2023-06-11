#include <Misc.au3>
#include <WinAPIError.au3>
#include <WinAPIFiles.au3>

Opt('TrayAutoPause', 0)

FileDelete(@TempDir & '\Test*.tmp')

Local $sFile = @TempDir & '\Test.tmp'
Local $hFile = FileOpen($sFile, 2)
For $i = 1 To 10000
	FileWriteLine($hFile, "                                                     ")
Next
FileClose($hFile)

Local $sNewFile = @TempDir & '\TestNeu.tmp'
FileCopy($sFile, $sNewFile)
If Not _WinAPI_ReplaceFile($sNewFile, $sFile) Then
	_WinAPI_ShowLastError('Fehler beim Ersetzen einer nicht vorhandenen Sicherung : ' & $sFile)
EndIf

FileCopy($sNewFile, $sFile, 1)
If Not _WinAPI_ReplaceFile($sNewFile, $sFile, @TempDir & '\TestBackup.tmp') Then
	_WinAPI_ShowLastError('Fehler beim Ersetzen : ' & $sFile)
EndIf

FileDelete(@TempDir & '\Test*.tmp')
