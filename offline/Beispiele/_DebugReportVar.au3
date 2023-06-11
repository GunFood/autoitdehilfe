#include <Debug.au3>

_DebugSetup("_DebugReportVar Beispiel", True)

Local $aArray2D[5][2]
For $r = 0 To UBound($aArray2D, 1) - 1
	For $c = 0 To UBound($aArray2D, 2) - 1
		$aArray2D[$r][$c] = $r & "," & $c
	Next
Next
_DebugReportVar("Array2D", $aArray2D)

Local $aArray[7] = [1, 1.1, "string", Binary(0x010203), Ptr(-1), False, Default]
_DebugReportVar("Array", $aArray)

Local $aArray3D[5][2][2]
For $r = 0 To UBound($aArray3D, 1) - 1
	For $c = 0 To UBound($aArray3D, 2) - 1
		For $k = 0 To UBound($aArray3D, 3) - 1
			$aArray3D[$r][$c][$k] = $r & "," & $c & "," & $k
		Next
	Next
Next
_DebugReportVar("Array3D", $aArray3D)

Local $aArray4D[5][2][2][10]
_DebugReportVar("Array4D", $aArray4D)

Local $iInt = -1
_DebugReportVar("int", $iInt)

Local $iInt64 = 2 ^ 63
_DebugReportVar("int64", $iInt64)

Local $bBool = True
_DebugReportVar("bool", $bBool)

Local $fFloat = 1.1
_DebugReportVar("float", $fFloat)

Local $vKeyword = Default
_DebugReportVar("keyword", $vKeyword)

Local $sString = "StringString"
_DebugReportVar("String", $sString)

Local $dBinary = Binary("0x0102030405060708")
_DebugReportVar("binary", $dBinary)

$dBinary = Binary("abcdefghij")
_DebugReportVar("binary", $dBinary)

Local $pPtr = Ptr(0)
_DebugReportVar("ptr", $pPtr)

Local $hWnd = WinActive("", "")
_DebugReportVar("hwnd", $hWnd)

Local $tDllstruct = DllStructCreate("int; ptr")
_DebugReportVar("dllstruct", $tDllstruct)

Local $oObj = ObjCreate("shell.application")
_DebugReportVar("obj", $oObj)
