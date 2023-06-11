#include <WinAPIError.au3>
#include <WinAPIFiles.au3>

Local $aDrive = DriveGetDrive('ALL')

If IsArray($aDrive) Then
	Local $sText
	For $i = 1 To $aDrive[0]
		If _WinAPI_IsWritable($aDrive[$i]) Then
			$sText = 'schreibbar'
		Else
			If @error Then
				$sText = 'Kein Medium'
				If @extended Then $sText &= ' ( @error=' & @error & ' LastError=' & _WinAPI_GetLastErrorMessage() & ')'
			Else
				$sText = 'Nicht schreibbar'
			EndIf
		EndIf
		ConsoleWrite(StringUpper($aDrive[$i]) & ' => ' & $sText & @CRLF)
	Next
EndIf
