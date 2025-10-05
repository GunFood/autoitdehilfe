; == Beispiel 2, mit Festplattennummer, Partitionsnummer

#include <AutoItConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Local $aDrive = DriveGetDrive("ALL")
Local $sOutput = "Nb Drives = " & $aDrive[0] & @CRLF & @CRLF, $sType, $sSsdStatus, $sBusType, $nDrive = 0

For $i = 1 To $aDrive[0]
	$sBusType = DriveGetType($aDrive[$i], $DT_BUSTYPE)
	$sSsdStatus = DriveGetType($aDrive[$i], $DT_SSDSTATUS)
	$sType = DriveGetType($aDrive[$i] & "\")
	$sOutput &= "Laufwerk " & $aDrive[$i] & @TAB & "Disk #" & _WinAPI_GetDriveNumber($aDrive[$i])[1] & @TAB & _
			"Partition #" & _WinAPI_GetDriveNumber($aDrive[$i])[2] & @TAB & "SSD Status = " & $sSsdStatus & @TAB & "BusType = " & $sBusType & @CRLF
Next

MsgBox($MB_SYSTEMMODAL, "DriveGetType (v" & @AutoItVersion & ")", $sOutput)
