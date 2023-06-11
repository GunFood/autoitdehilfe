#include <IE.au3>

; Stellt einen Verweis auf eine spezifische Form vom 0-basierenden Index her;
; In diesem Fall die erste Form auf der Seite

Local $oIE = _IECreate("http://www.google.com")
Local $oForm = _IEFormGetCollection($oIE, 0)
Local $oQuery = _IEFormElementGetCollection($oForm, 4)
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
_IEFormSubmit($oForm)
