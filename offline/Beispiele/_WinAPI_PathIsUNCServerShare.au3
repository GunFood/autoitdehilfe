;-- TIME_STAMP   2017-11-27 01:52:33   v 0.1

#Region    ;************ Includes ************
#Include <WinAPIShPath.au3>
#EndRegion ;************ Includes ************

_Example(@WindowsDir)
_Example(@ComSpec)
_Example(@LogonServer)
_Example(@LogonServer & '\MyShare')

Func _Example($sPath)
	ConsoleWrite('> $sPath = ' & $sPath & @CRLF)
	ConsoleWrite(StringFormat('%s\r\r', _WinAPI_PathIsUNCServerShare($sPath) ? '+ Der Pfad ist in der Form "\\server\share".' : '! Der Pfad ist nicht in der Form "\\server\share".'))
EndFunc
