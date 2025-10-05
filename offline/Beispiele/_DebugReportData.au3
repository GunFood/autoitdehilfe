#include <Debug.au3>

_DebugSetup("_DebugReportData examples", True)

Local $aArray2D[5][5]
For $r = 0 To UBound($aArray2D, 1) - 1
	For $c = 0 To UBound($aArray2D, 2) - 1
		$aArray2D[$r][$c] = $r & "," & $c
	Next
Next

_DebugReportData($aArray2D, "Array2D")
_DebugReportData($aArray2D, "Array2D NO ROW no header", "", $ARRAYDISPLAY_NOROW)
_DebugReportData($aArray2D, "Array2D no header Transposed", "", $ARRAYDISPLAY_TRANSPOSE)

_DebugReportData($aArray2D, "Array2D header col0", "", 0, Default, "zero")
_DebugReportData($aArray2D, "Array2D header col0 Transposed", "", $ARRAYDISPLAY_TRANSPOSE, Default, "zero")
_DebugReportData($aArray2D, "Array2D header col0 col1", "", 0, Default, "zero|one")
_DebugReportData($aArray2D, "Array2D header col0 col1 (|1)", "|1", 0, Default, "zero|one")

_DebugReportData($aArray2D, "Array2D header col0 col1 (|1:2)", "|1:2", 0, Default, "zero|one")
_DebugReportData($aArray2D, "Array2D header col0 col1 (|1:2)", "|1:2 Transposed", $ARRAYDISPLAY_TRANSPOSE, Default, "zero|one")
_DebugReportData($aArray2D, "Array2D NO ROW header col0 col1 (|1:2)", "|1:2", $ARRAYDISPLAY_NOROW, Default, "zero|one")
_DebugReportData($aArray2D, "Array2D NO ROW header col0 col1 (|1:2) Transposed", "|1:2", $ARRAYDISPLAY_NOROW + $ARRAYDISPLAY_TRANSPOSE, Default, "zero|one")
_DebugReportData($aArray2D, "Array2D header col0 col1 (2:3|1:2)", "2:3|1:2", 0, Default, "zero|one")

_DebugReportData($aArray2D, "Array2D header col0 col1 (2:3|1:2) Transposed", "2:3|1:2", $ARRAYDISPLAY_TRANSPOSE, Default, "zero|one")
_DebugReportData($aArray2D, "Array2D NO ROW header col0 col1 (2:3|1:2)", "2:3|1:2", $ARRAYDISPLAY_NOROW, Default, "zero|one")

Local $aArray[7] = [1, 1.1, "string", Binary(0x010203), Ptr(-1), False, Default]
_DebugReportData($aArray, "Array")

Local $aArray3D[5][2][3]
For $r = 0 To UBound($aArray3D, 1) - 1
	For $c = 0 To UBound($aArray3D, 2) - 1
		For $k = 0 To UBound($aArray3D, 3) - 1
			$aArray3D[$r][$c][$k] = $r & "," & $c & "," & $k
		Next
	Next
Next

_DebugReportData($aArray3D, "$Array3D")

Local $aArray4D[5][2][2][10]
_DebugReportData($aArray4D, "$Array4D")

Local $iInt = -1
_DebugReportData($iInt, "$iInt")

Local $iInt64 = 2 ^ 63
_DebugReportData($iInt64, "$iInt64")

Local $bBool = True
_DebugReportData($bBool, "$bBool")

Local $fFloat = 1.1
_DebugReportData($fFloat, "$fFloat")

Local $vKeyword = Default
_DebugReportData($vKeyword, "$vKeyword")

Local $sString = "stringstring"
_DebugReportData($sString, "$sString")

Local $dBinary = Binary("0x0102030405060708")
_DebugReportData($dBinary, "$dbinary")

$dBinary = Binary("abcdefghij")
_DebugReportData($dBinary, "$dbinary")

Local $pPtr = Ptr(0)
_DebugReportData($pPtr, "$pPtr")

Local $hWnd = WinActive("", "")
_DebugReportData($hWnd, "$hWnd")

Local $tDllstruct = DllStructCreate("int; ptr")
_DebugReportData($tDllstruct, "$tDllstruct")

Local $oObj = ObjCreate("shell.application")
_DebugReportData($oObj, "$oObj")

_DebugReport(@CRLF & "=== ConsoleWrite() can be replaced by _DebugReportData() when using Debug lines ===" & @CRLF)
; _DebugReportData() can be used in Debug Line instead of ConsoleWrite(), _DebugSetup() must be added before
Local $iRet = 1
;~ ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $iRet = ' & $iRet & @CRLF & '>Error code: ' & @error & '    Extended code: ' & @extended & ' (0x' & Hex(@extended) & ')' & @CRLF) ;### Debug Console
_DebugReportData('@@ Debug(' & @ScriptLineNumber & ') : $iRet = ' & $iRet & @CRLF & '>Error code: ' & @error & '    Extended code: ' & @extended & ' (0x' & Hex(@extended) & ')' & @CRLF) ;### Debug Console

; for Array 1D or 2D, it is better to use directly _DebugReportData() which will produce an output formattend by column(s)
ReDim $aArray2D[5][2]
For $r = 0 To UBound($aArray2D, 1) - 1
	For $c = 0 To UBound($aArray2D, 2) - 1
		$aArray2D[$r][$c] = $r & "," & $c
	Next
Next

_DebugReportData($aArray2D, "$Array2D display by columns")
_DebugReportVar("$Array2D by _DebugReportVar()", $aArray2D)
