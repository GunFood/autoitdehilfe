#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Local $aDrive = DriveGetDrive('CDROM')

If IsArray($aDrive) Then
	_WinAPI_LockDevice($aDrive[1], 1)
	MsgBox($MB_SYSTEMMODAL, '', 'Das Laufwerk (' & StringUpper($aDrive[1]) & ') ist gesperrt.')
	_WinAPI_LockDevice($aDrive[1], 0)
	MsgBox($MB_SYSTEMMODAL, '', 'Das Laufwerk (' & StringUpper($aDrive[1]) & ') ist nicht gesperrt.')
EndIf
