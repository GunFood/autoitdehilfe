;-- TIME_STAMP   2017-11-26 20:47:01   v 0.1

#Region    ;************ Includes ************
#Include <WinAPIShPath.au3>
#EndRegion ;************ Includes ************

_Example(@SystemDir)
_Example('cmd.exe')

Func _Example($sFilePath)
	ConsoleWrite('> $sFilePath = ' & $sFilePath & @CRLF)
	ConsoleWrite(StringFormat('+ %s\r\r', _WinAPI_PathIsFileSpec($sFilePath) ? 'Es gibt keine pfadbegrenzenden Zeichen (":" oder "\") innerhalb des Pfades. ' : 'Es gibt pfadbegrenzende Zeichen.'))
EndFunc

