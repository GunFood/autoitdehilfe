#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Example()

Func Example()
	; Ermitteln Sie den Laufwerkstyp des Stammlaufwerks, in der Regel ist dies das Laufwerk C:\.
	Local $iTypeOfDrive = _WinAPI_GetDriveType(@HomeDrive) ; Zum Beispiel C:

	; Erstellt eine Variable für die Anzeige der Nachricht.
	Local $sMessage = ""
	Switch $iTypeOfDrive
		Case $DRIVE_UNKNOWN
			$sMessage = "Der Laufwerkstyp kann nicht bestimmt werden."
		Case $DRIVE_NO_ROOT_DIR
			$sMessage = "Der Wurzelpfad ist ungültig."
		Case $DRIVE_REMOVABLE
			$sMessage = "Das Laufwerk ist ein Wechselmedium."
		Case $DRIVE_FIXED
			$sMessage = "Das Laufwerk ist ein festes Laufwerk."
		Case $DRIVE_REMOTE
			$sMessage = "Das Laufwerk ist ein entferntes (Netz-)Laufwerk."
		Case $DRIVE_CDROM
			$sMessage = "Das Laufwerk ist ein CD-ROM-Laufwerk."
		Case $DRIVE_RAMDISK
			$sMessage = "Das Laufwerk ist eine RAM-Disk."
	EndSwitch

	; Anzeige der Meldung über den Laufwerkstyp.
	MsgBox($MB_SYSTEMMODAL, "", $sMessage)
EndFunc   ;==>Example
