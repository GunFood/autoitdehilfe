;-- TIME_STAMP   2017-11-26 20:56:08   v 0.1

#Region    ;************ Includes ************
#Include <WinAPIShPath.au3>
#EndRegion ;************ Includes ************

_Example(@SystemDir)
_Example(@SystemDir & '\cmd.exe')

Func _Example($sFilePath)
	ConsoleWrite('> $sFilePath  = ' & $sFilePath & @CRLF)
	ConsoleWrite(StringFormat('+ Erweiterung = "%s"\r\r', _WinAPI_PathFindExtension($sFilePath)))
EndFunc
