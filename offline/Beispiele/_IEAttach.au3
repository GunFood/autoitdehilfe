#include <IE.au3>
#include <MsgBoxConstants.au3>

; Verbindet sich mit einem geöffneten Internet Explorer, in dessen Titel "AutoIt" vorkommt und gibt die URL aus.

Local $oIE = _IECreate("www.autoitscript.com")
Local $oIE1 = _IECreate("www.google.com")

$oIE = _IEAttach("AutoIt")
MsgBox($MB_SYSTEMMODAL, "Die URL", _IEPropertyGet($oIE, "locationurl"))

_IEQuit($oIE)
_IEQuit($oIE1)
