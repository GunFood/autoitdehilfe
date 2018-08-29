#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Local Const $sPath = @TempDir & '\Mount\'

Local $sGUID = _WinAPI_GetVolumeNameForVolumeMountPoint(@HomeDrive & '\')

DirCreate($sPath)
_WinAPI_SetVolumeMountPoint($sPath, $sGUID)
MsgBox($MB_SYSTEMMODAL, '', 'Das Laufwerk (' & StringUpper(@HomeDrive) & ') wurde mit "' & $sPath & '" verknüpft.')
_WinAPI_DeleteVolumeMountPoint($sPath)
DirRemove($sPath)
