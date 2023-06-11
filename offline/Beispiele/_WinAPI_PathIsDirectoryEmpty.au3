;-- TIME_STAMP   2017-11-26 20:33:19   v 0.1

#Region    ;************ Includes ************
#Include <WinAPIFiles.au3>
#EndRegion ;************ Includes ************

Local $sTempDir = @TempDir & '\' & _WinAPI_PathRemoveExtension(@ScriptName)

_Example($sTempDir)

DirCreate($sTempDir)

_Example($sTempDir)

FileWrite($sTempDir & '\Test.txt', 'ABCde')

_Example($sTempDir)

DirRemove($sTempDir, $DIR_REMOVE)

Func _Example($sFilePath)
	ConsoleWrite('> $sFilePath   = ' & $sFilePath & @CRLF)
	If Not FileExists($sFilePath) Then ; _WinAPI_PathIsDirectoryEmpty fängt diesen Fehler nicht ab und behauptet in dem Fall, das Verzeichnis wäre nicht leer!
		ConsoleWrite('! Das Verzeichnis existiert nicht!' & @CRLF & @CRLF)
	Else
		ConsoleWrite(StringFormat('%s\r\r', _WinAPI_PathIsDirectoryEmpty($sFilePath) ? '- Das Verzeichnis ist leer!' : '+ Das Verzeichnis ist nicht leer!'))
	EndIf
EndFunc
