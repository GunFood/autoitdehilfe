; Option 2, einfacher Rückgabewert, php/preg_match()-Stil

#include <MsgBoxConstants.au3>
#include <StringConstants.au3>

Local $aArray = StringRegExp('<test>a</test> <test>b</test> <test>c</Test>', '(?i)<test>(.*?)</test>', $STR_REGEXPARRAYFULLMATCH)
For $i = 0 To UBound($aArray) - 1
	MsgBox($MB_SYSTEMMODAL, "RegExp Test mit Option 2 - " & $i, $aArray[$i])
Next
