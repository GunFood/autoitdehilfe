#include <Array.au3>
#include <Inet.au3>
#include <MsgBoxConstants.au3>

Global $aResult, $sResult, $sIp

TCPStartup()
$sIp = _GetIP()
$aResult = _TCPIpToName($sIp, 1)
If @error Then
	MsgBox($MB_SYSTEMMODAL, "_TCPIpToName()", "@error = " & @error & @CRLF & "@extended = " & @extended)
Else
	_ArrayDisplay($aResult, "Lokale(r) Hostname(n)")
EndIf
