;-- TIME_STAMP   2017-11-27 21:52:10   v 0.1

#Region    ;************ Includes ************
#Include <WinAPIFiles.au3>
#EndRegion ;************ Includes ************

; Achtung: Mit "SystemFolder" ist nicht das Attribut $FILE_ATTRIBUTE_SYSTEM (0x04) gemeint, sondern $FILE_ATTRIBUTE_READONLY (0x01) dass gesetzt wird, wenn das Verzeichnis über desktop.ini angepasst wird.

_WinAPI_PathMakeSystemFolder(@ScriptDir)
_Example(@ScriptDir)

_WinAPI_PathUnmakeSystemFolder(@ScriptDir)
_Example(@ScriptDir)

Func _Example($sPath)
;~ 	ConsoleWrite(StringFormat( '\r> $sPath       = %s\r- FileAttrib   = %s\r+ SystemFolder = %s\r\r', $sPath, FileGetAttrib($sPath), (_WinAPI_PathIsSystemFolder($sPath) = True)))
;~ 	ConsoleWrite(StringFormat( '\r> $sPath       = %s\r- FileAttrib   = %s\r+ SystemFolder = %s\r\r', $sPath, _WinAPI_GetFileAttributes($sPath), (_WinAPI_PathIsSystemFolder($sPath) = True)))
	Local $sFileAttributes = _GetFileAttributes($sPath), $iFileAttributes = @extended
	ConsoleWrite(StringFormat( '\r> $sPath       = %s\r- FileAttrib   = %i [%s]\r+ SystemFolder = %s\r\r', $sPath, $iFileAttributes, $sFileAttributes, (_WinAPI_PathIsSystemFolder($sPath) = True)))
EndFunc

Func _GetFileAttributes($sPath)
	Local Static $aAttrib = [	[0x00000000, 'Z', 'FILE_NOT_FOUND'], _
								[0x00000001, 'R', 'READONLY'], _
								[0x00000002, 'H', 'HIDDEN'], _
								[0x00000004, 'S', 'SYSTEM'], _
								[0x00000010, 'D', 'DIRECTORY'], _
								[0x00000020, 'A', 'ARCHIVE'], _
								[0x00000040, 'V', 'DEVICE'], _
								[0x00000080, 'N', 'NORMAL'], _
								[0x00000100, 'T', 'TEMPORARY'], _
								[0x00000200, 'P', 'SPARSE_FILE'], _
								[0x00000400, 'E', 'REPARSE_POINT'], _
								[0x00000800, 'C', 'COMPRESSED'], _
								[0x00001000, 'O', 'OFFLINE'], _
								[0x00002000, 'I', 'NOT_CONTENT_INDEXED'], _
								[0x00004000, 'X', 'ENCRYPTED']]

	Local $iAttrib = _WinAPI_GetFileAttributes($sPath)

	If $iAttrib = 0 Then Return SetExtended(0, 'Z')

	Local $sAttrib
	For $i = 1 To UBound($aAttrib) -1 Step 1
		If BitAND($iAttrib, $aAttrib[$i][0]) = $aAttrib[$i][0] Then $sAttrib &= $aAttrib[$i][1]
	Next
	Return SetExtended($iAttrib, $sAttrib)
EndFunc
