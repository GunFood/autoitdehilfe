#include <WinAPIConv.au3>
#include <WinAPILocale.au3>
#include <WinAPISys.au3>

Local $hKeyboardLayout = _WinAPI_GetKeyboardLayout()
Local $sStr = $hKeyboardLayout & ' (' & _WinAPI_GetLocaleInfo(_WinAPI_HiWord($hKeyboardLayout), $LOCALE_SENGLANGUAGE) & ')'

MsgBox(0, "GetKeyboardLayout - v(" & @AutoItVersion & ")", $sStr)
