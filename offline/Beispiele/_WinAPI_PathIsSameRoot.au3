;-- TIME_STAMP   2017-11-27 00:14:09   v 0.1

#Region    ;************ Includes ************
#Include <WinAPIShPath.au3>
#EndRegion ;************ Includes ************

_Example('c:\Program Files (x86)\AutoIt3\Au3Info.exe', 'c:\Windows\notepad.exe')
_Example('c:\Windows\System32\cmd.exe', 'd:\Setup.exe')

Func _Example($sPath1, $sPath2)
	ConsoleWrite('> $sPath1 = ' & $sPath1 & @CRLF)
	ConsoleWrite('> $sPath2 = ' & $sPath2 & @CRLF)
	ConsoleWrite(StringFormat('%s\r\r', _WinAPI_PathIsSameRoot($sPath1, $sPath2) ? '+ Beide Zeichenfolgen haben das gleiche Stammverzeichnis.' : '! Beide Strings haben nicht das gleiche Stammverzeichnis.'))
EndFunc
