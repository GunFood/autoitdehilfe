#include <File.au3>
#include <MsgBoxConstants.au3>

Local $sTestPath = _PathMake("c:", "\temp", "boot", "ini")
MsgBox($MB_SYSTEMMODAL, "demo _PathMake", $sTestPath)
