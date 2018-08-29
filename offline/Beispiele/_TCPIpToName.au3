#include <Inet.au3>
#include <MsgBoxConstants.au3>

Global $aResult, $sResult, $sIp

TCPStartup()
$sIp = TCPNameToIP("autoitscript.com")
$sResult = _TCPIpToName($sIp)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "_TCPIpToName()", "@error = " & @error & @CRLF & "@extended = " & @extended)
Else
	MsgBox($MB_SYSTEMMODAL, "autoitscript.com ist wirklich: ", $sResult)
EndIf

