#include <IE.au3>

; Eine Referenz auf ein bestimmtes Formularfeld erhalten und den Wert eingeben.
; Ruft _IELoadWait manuell auf, falls die Default-_IELoadWait Probleme hat.

Local $oIE = _IECreate("http://www.google.com")
Local $oForm = _IEFormGetCollection($oIE, 0)
Local $oQuery = _IEFormElementGetCollection($oForm, 4)
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
_IEFormSubmit($oForm, 0)
_IELoadWait($oIE)
