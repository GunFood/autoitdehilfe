;-- TIME_STAMP   2017-11-27 00:02:28   v 0.1

#Region    ;************ Includes ************
#Include <WinAPIShPath.au3>
#EndRegion ;************ Includes ************

_Example(@SystemDir)
_Example(@HomeDrive)
_Example(@HomeDrive & '\')

Func _Example($sFilePath)
	ConsoleWrite('> $sFilePath = ' & $sFilePath & @CRLF)
	ConsoleWrite(StringFormat('%s\r\r', _WinAPI_PathIsRoot($sFilePath) ? '+ Der Pfad ist ein Stammverzeichnis.' : '! Der Pfad ist kein Stammverzeichnis.'))
EndFunc
