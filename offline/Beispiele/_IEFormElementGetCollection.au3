#include <IE.au3>

; Erhält einen Bezug zu einem bestimmten Formelement durch einen 0-basierenden Index.
; In diesem Fall wird eine Eingabe in der Google Suchmaschine getätigt

Local $oIE = _IECreate("http://www.google.de")
Local $oForm = _IEFormGetCollection($oIE, 0)
Local $oQuery = _IEFormElementGetCollection($oForm, 4)
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
_IEFormSubmit($oForm)
