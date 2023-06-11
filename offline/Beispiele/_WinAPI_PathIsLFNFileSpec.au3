;-- TIME_STAMP   2017-11-26 22:51:01   v 0.1

#Region    ;************ Includes ************
#Include <WinAPIShPath.au3>
#EndRegion ;************ Includes ************

_Example()

Func _Example()
	Local $sFilePath = 'c:\Program Files (x86)\AutoIt3\Au3Info_x64.exe'
	Local $sLongFileName = StringRegExpReplace($sFilePath, '.+\\(.+)', '\1')
	Local $sShortFileName = StringRegExpReplace(FileGetShortName($sFilePath), '.+\\(.+)', '\1')

	ConsoleWrite('> $sFilePath = ' & $sFilePath & @CRLF & @CRLF)

	_IsLFN($sLongFileName)
	_IsLFN($sShortFileName)
EndFunc


Func _IsLFN($sFileName)
	ConsoleWrite('- $sFileName = ' & $sFileName & @CRLF)
	ConsoleWrite(StringFormat('%s\r\r', _WinAPI_PathIsLFNFileSpec($sFileName) ? '! Die Datei überschreitet die Anzahl der vom 8.3-Format zulässigen Zeichen.' : '+ Die Datei ist im 8.3 Format.'))
EndFunc
