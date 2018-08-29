;-- TIME_STAMP   2017-11-27 00:26:42   v 0.1

#Region    ;************ Includes ************
#Include <WinAPIShPath.au3>
#EndRegion ;************ Includes ************

_Example()

Func _Example()
	Local $sPath = @TempDir & '\TestFolder'
	DirCreate($sPath)
	_IsSystemFolder($sPath)
	FileSetAttrib($sPath, '+S')
	_IsSystemFolder($sPath)
	DirRemove($sPath)
EndFunc

Func _IsSystemFolder($sPath)
	ConsoleWrite('> $sPath = ' & $sPath & @CRLF)
	ConsoleWrite(StringFormat('%s\r\r', _WinAPI_PathIsSystemFolder($sPath) ? '+ Der Pfad ist ein Systemordner.' : '! Der Pfad ist kein Systemordner.'))
EndFunc
