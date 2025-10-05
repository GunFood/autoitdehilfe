#include <WinAPISys.au3>

Local $sName = _WinAPI_GetKeyboardLayoutLocale()

MsgBox(0, "GetKeyboardLayoutLocale - v(" & @AutoItVersion & ")", $sName)
