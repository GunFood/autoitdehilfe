#include <WinAPIConv.au3>

;~ Global Const $CP = 0 ; CP_ACP Standard Codepage
;~ Global Const $CP = GetACP() ; aktuelle Codepage
;~ Global Const $CP = 65001 ; UTF-8 sicherlich der beste Wert
Global Const $CP = 932 ; CP_SHIFT_JIS

Local $sText = "データのダウンロードに失敗しました。"
;~ Local $sText = "abcdefg 1234567890"

Local $sOutput = @TAB & @TAB & "Codepage =" & $CP & @CRLF & @CRLF
$sOutput &= @TAB & "String[" & StringLen($sText) & "] = " & $sText & @CRLF & @CRLF

; ============== _WinAPI_WideCharToMultiByte Test ==============

Local $sTest = _WinAPI_WideCharToMultiByte($sText, $CP, True, False)
$sOutput &= "WideChar in String (MultiByte)" & @TAB & VarGetType($sTest) & " " & StringLen($sTest) & " :" & @CRLF & $sTest & @CRLF & @CRLF

$sTest = _WinAPI_WideCharToMultiByte($sText, $CP, True, True)
$sOutput &= "WideChar in Binary" & @TAB & VarGetType($sTest) & " " & BinaryLen($sTest) & " :" & @CRLF & $sTest & @CRLF & @CRLF

; ============== _WinAPI_MultiByteToWideChar Test ==============

Local $sMultiByte = _WinAPI_WideCharToMultiByte($sText, $CP, True, False)
$sOutput &= @CRLF & @TAB & "MultiByte[" & StringLen($sMultiByte) & "] = " & $sMultiByte & @CRLF & @CRLF

Local $tStruct = _WinAPI_MultiByteToWideChar($sMultiByte, $CP, 0, False)
$sOutput &= "MultiByte in Struct" & @TAB & @TAB & VarGetType($tStruct) & " " & DllStructGetSize($tStruct) & " :" & @CRLF & DllStructGetData($tStruct, 1) & @CRLF & @CRLF

$sTest = _WinAPI_MultiByteToWideChar($sMultiByte, $CP, 0, True)
$sOutput &= "MultiByte in String" & @TAB & VarGetType($sTest) & " " & StringLen($sTest) & " :" & @CRLF & $sTest & @CRLF & @CRLF

Local $iMB_TYPE = 0
If $sTest == $sText Then
	$sOutput &= @CRLF & @TAB & @TAB & "Konvertierung OK"
Else
	$sOutput &= @CRLF & @TAB & @TAB & " !!! Fehler bei der Konvertierung !!!"
	$iMB_TYPE = $MB_ICONERROR
EndIf

MsgBox($MB_SYSTEMMODAL + $iMB_TYPE, "Ergebnisse", $sOutput)

Func GetACP()
	Local $aResult = DllCall("kernel32.dll", "int", "GetACP")
	If @error Or Not $aResult[0] Then Return SetError(@error + 20, @extended, "")
	Return $aResult[0]
EndFunc   ;==>GetACP
