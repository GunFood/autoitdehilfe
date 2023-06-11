#include <IE.au3>
#include <MsgBoxConstants.au3>

; Abrufen und anzeigen von IE.au3 Versionsinformationen

Local $aVersion = _IE_VersionInfo()
MsgBox($MB_SYSTEMMODAL, "IE.au3 Version", $aVersion[5] & " veröffentlicht " & $aVersion[4]) 4])
