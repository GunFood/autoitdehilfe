#include <IE.au3>

; Bekommt einen Bezug zu einem bestimmten Input-Control durch dessen Name.
; In diesem Fall zu der Google-Suche. Es ist zu beachten, dass die Namen der Input-Controls und deren Inhalte im Quelltext gefunden werden können.

Local $oIE = _IECreate("http://www.google.com")
Local $oForm = _IEFormGetObjByName($oIE, "gbqf")
Local $oQuery = _IEFormElementGetObjByName($oForm, "q")
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
_IEFormSubmit($oForm)
