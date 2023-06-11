; Option 2, einfacher Rückgabewert, php/preg_match()-Stil

#include <MsgBoxConstants.au3>
#include <StringConstants.au3>

Local $aArray = 0, _
		$iOffset = 1, $iOffsetStart
While 1
	$iOffsetStart = $iOffset
	$aArray = StringRegExp('<test>a</test> <test>b</test> <test>c</Test>', '(?i)<test>(.*?)</test>', $STR_REGEXPARRAYFULLMATCH, $iOffset)
	If @error Then ExitLoop
	$iOffset = @extended
	For $i = 0 To UBound($aArray) - 1 Step 2
		MsgBox($MB_SYSTEMMODAL, "Option 2 bei " & $iOffsetStart, $aArray[$i] & @TAB & "captured = " & $aArray[$i + 1])
	Next
WEnd
