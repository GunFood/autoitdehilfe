;-- TIME_STAMP   2017-11-26 20:52:06   v 0.1

#Region    ;************ Includes ************
#Include <WinAPIShPath.au3>
#EndRegion ;************ Includes ************

_Example('?')
_Example('*')
_Example('@')
_Example(':')
_Example('\')
_Example('/')
_Example('A')
_Example('ä')
_Example('9')

Func _Example($sChar)
	Local Static $aCharType = [ [$GCT_INVALID	, '0 Das Zeichen ist in einem Pfad nicht gültig.'], _
								[$GCT_LFNCHAR	, '1 Das Zeichen ist in einem langen Dateinamen gültig.'], _
								[$GCT_SEPARATOR	, '8 Das Zeichen ist ein Pfadtrennzeichen.'], _
								[$GCT_SHORTCHAR	, '2 Das Zeichen ist in einem kurzen Dateinamen (8.3) gültig.'], _
								[$GCT_WILD		, '4 Das Zeichen ist ein Platzhalterzeichen.']]

	ConsoleWrite('> $sChar     = ' & $sChar & @CRLF)
	Local $iCharType = _WinAPI_PathGetCharType($sChar)
	ConsoleWrite('> $iCharType = ' & $iCharType & @CRLF)
	For $i = 0 To UBound($aCharType) -1 Step 1
		If $iCharType = $GCT_INVALID Then
			ConsoleWrite('! ' & $aCharType[$i][1] & @CRLF)
			ExitLoop
		Else
			If $i = 0 Then ContinueLoop
			Switch BitAND($iCharType, $aCharType[$i][0])
				Case  $aCharType[$i][0]
					ConsoleWrite('+ ' & $aCharType[$i][1] & @CRLF)
			EndSwitch
		EndIf
	Next
	ConsoleWrite(@CRLF)
EndFunc
