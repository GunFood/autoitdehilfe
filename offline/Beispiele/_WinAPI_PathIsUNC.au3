;-- TIME_STAMP   2017-11-27 00:32:53   v 0.1

#Region    ;************ Includes ************
#Include <WinAPIShPath.au3>
#EndRegion ;************ Includes ************

_Example(@ScriptDir)
_Example('\\Server\C\Windows\')

Func _Example($sPath)
	ConsoleWrite('> $sPath = ' & $sPath & @CRLF)
	ConsoleWrite(StringFormat('%s\r\r', _WinAPI_PathIsUNC($sPath) ? '+ Der Pfad ist ein g�ltiger UNC-Pfad.' : '! Der Pfad ist kein g�ltiger UNC-Pfad.'))
EndFunc

