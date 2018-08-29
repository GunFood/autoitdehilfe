#include <MsgBoxConstants.au3>

Local $aArray[2] = [1, "Beispiel"]
Local $mMap[]
Local $dBinary = Binary("0x00204060")
Local $bBoolean = False
Local $pPtr = Ptr(-1)
Local $hWnd = WinGetHandle("[CLASS:Shell_TrayWnd]")
Local $iInt = 1
Local $fFloat = 2.0
Local $oObject = ObjCreate("Scripting.Dictionary")
Local $sString = "Etwas Text"
Local $tStruct = DllStructCreate("wchar[256]")
Local $vKeyword = Default
Local $fuFunc = ConsoleWrite
Local $fuUserFunc = Test

MsgBox($MB_SYSTEMMODAL, "", _
		"Variablentypen" & @CRLF & @CRLF & _
		"$aArray ist ein " & @TAB & @TAB & VarGetType($aArray) & " Variablentyp." & @CRLF & _
		"$mMap : " & @TAB & @TAB & VarGetType($mMap) & " Variablentyp." & @CRLF & _
		"$dBinary ist ein " & @TAB & @TAB & VarGetType($dBinary) & " Variablentyp." & @CRLF & _
		"$bBoolean ist ein " & @TAB & @TAB & VarGetType($bBoolean) & " Variablentyp." & @CRLF & _
		"$pPtr ist ein " & @TAB & @TAB & VarGetType($pPtr) & " Variablentyp." & @CRLF & _
		"$hWnd ist ein " & @TAB & @TAB & VarGetType($hWnd) & " Variablentyp." & @CRLF & _
		"$iInt ist ein " & @TAB & @TAB & VarGetType($iInt) & " Variablentyp." & @CRLF & _
		"$fFloat ist ein " & @TAB & @TAB & VarGetType($fFloat) & " Variablentyp." & @CRLF & _
		"$oObject ist ein " & @TAB & @TAB & VarGetType($oObject) & " Variablentyp." & @CRLF & _
		"$sString ist ein " & @TAB & @TAB & VarGetType($sString) & " Variablentyp." & @CRLF & _
		"$tStruct ist ein " & @TAB & @TAB & VarGetType($tStruct) & " Variablentyp." & @CRLF & _
		"$vKeyword ist ein " & @TAB & @TAB & VarGetType($vKeyword) & " Variablentyp." & @CRLF & _
		"MsgBox : " & @TAB & @TAB & VarGetType(MsgBox) & " Variablentyp." & @CRLF & _
		"$fuFunc : " & @TAB & @TAB & VarGetType($fuFunc) & " Variablentyp." & @CRLF & _
		"Func 'Test' : " & @TAB & VarGetType(Test) & " Variablentyp." & @CRLF & _
		"$fuUserFunc : " & @TAB & VarGetType($fuUserFunc) & " Variablentyp.")

Func Test()
EndFunc   ;==>Test
