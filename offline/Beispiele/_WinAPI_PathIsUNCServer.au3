;-- TIME_STAMP   2017-11-27 01:47:17   v 0.1

#Region    ;************ Includes ************
#Include <WinAPIShPath.au3>
#EndRegion ;************ Includes ************

_Example(@WindowsDir)
_Example(@ComputerName)
_Example(@LogonServer)

Func _Example($sPath)
	ConsoleWrite('> $sPath = ' & $sPath & @CRLF)
	ConsoleWrite(StringFormat('%s\r\r', _WinAPI_PathIsUNCServer($sPath) ? '+ Der Pfad ist ein g�ltiger UNC-Pfad nur f�r einen Server (kein Freigabename).' : '! Der Pfad ist kein g�ltiger UNC-Pfad. '))
EndFunc
