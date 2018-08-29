#include <WinAPIFiles.au3>

Local $aData, $iDrive = 0

While 1
	$aData = _WinAPI_GetDriveGeometryEx($iDrive)
	If @error Then
		ExitLoop
	EndIf
	If Not $iDrive Then
		ConsoleWrite('-------------------------------' & @CRLF)
	EndIf
	ConsoleWrite('Laufwerk: ' & $iDrive & @CRLF)
	ConsoleWrite('Zylinder: ' & $aData[0] & @CRLF)
	ConsoleWrite('Tracks pro Zylinderr: ' & $aData[2] & @CRLF)
	ConsoleWrite('Sektoren pro Track: ' & $aData[3] & @CRLF)
	ConsoleWrite('Bytes pro Sektor: ' & $aData[4] & @CRLF)
	ConsoleWrite('Gesamter Speicher: ' & $aData[5] & ' Bytes' & @CRLF)
	ConsoleWrite('-------------------------------' & @CRLF)
	$iDrive += 1
WEnd
