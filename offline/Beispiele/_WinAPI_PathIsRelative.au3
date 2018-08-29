;-- TIME_STAMP   2017-11-26 23:54:20   v 0.1

#Region    ;************ Includes ************
#Include <WinAPIShPath.au3>
#EndRegion ;************ Includes ************

_Example()

Func _Example()
	_PathIsRelative('c:\Program Files (x86)\AutoIt3\SciTE\api\')
	_PathIsRelative('..\SciTE\api\')
	_PathIsRelative('..\..\AutoIt3\Au3Info.exe')
EndFunc

Func _PathIsRelative($sPath)
	ConsoleWrite('> $sPath = ' & $sPath & @CRLF)
	ConsoleWrite(StringFormat('%s\r\r', _WinAPI_PathIsRelative($sPath) ? '! Der Pfad ist relativ.' : '+ Der Pfad ist nicht relativ.'))
EndFunc
