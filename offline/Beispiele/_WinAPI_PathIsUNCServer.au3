;-- TIME_STAMP   2017-11-27 01:47:17   v 0.1

#Region    ;************ Includes ************
#Include <WinAPIShPath.au3>
#EndRegion ;************ Includes ************

_Example(@WindowsDir)
_Example(@ComputerName)
_Example(@LogonServer)

Func _Example($sPath)
	ConsoleWrite('> $sPath = ' & $sPath & @CRLF)
	ConsoleWrite(StringFormat('%s\r\r', _WinAPI_PathIsUNCServer($sPath) ? '+ Der Pfad ist ein gültiger UNC-Pfad nur für einen Server (kein Freigabename).' : '! Der Pfad ist kein gültiger UNC-Pfad. '))
EndFunc
