#include <Debug.au3>
#include <WinAPIRes.au3>

_DebugSetup('Test', True)

GUICreate("Test Caret")
GUICtrlCreateInput("", 10, 10)
GUISetState()

Local $aCaret = _WinAPI_GetCaretPos()

_DebugReportVar('aCaret', $aCaret, True)
