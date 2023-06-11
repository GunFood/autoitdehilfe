#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>

; Holt den Typ des Laufwerks von C:\
Local $sInfo = DriveGetType("C:\")
MsgBox($MB_SYSTEMMODAL, "", "Laufwerktyp: " & $sInfo)

; Holt den SSD Status von C:\
$sInfo = DriveGetType("C:\", $DT_SSDSTATUS)
MsgBox($MB_SYSTEMMODAL, "", "Laufwerk SSD: " & $sInfo)

; Holt den SSD Status von Laufwerk 0 (disk 0)
$sInfo = DriveGetType(0, $DT_SSDSTATUS)
MsgBox($MB_SYSTEMMODAL, "", "Laufwerk SSD: " & $sInfo)

; Holt den Bus-Typ-Status von Laufwerk 0 (disk 0)
$sInfo = DriveGetType(0, $DT_BUSTYPE)
MsgBox($MB_SYSTEMMODAL, "", "Laufwerkbus: " & $sInfo)
