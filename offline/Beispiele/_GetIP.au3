#include <Inet.au3>
#include <MsgBoxConstants.au3>

Local $PublicIP = _GetIP()
MsgBox($MB_SYSTEMMODAL, "IP Adresse", "Deine IP-Adresse lautet: " & $PublicIP)
