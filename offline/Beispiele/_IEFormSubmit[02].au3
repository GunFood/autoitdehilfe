#include <IE.au3>

; Eine Referenz auf ein bestimmtes Formularfeld erhalten und den Wert eingeben.
; In diesem Fall wird eine Suche in der Suchmaschine von Google ausgeführt.

Local $oIE = _IECreate("http://www.google.com")
Local $oForm = _IEFormGetCollection($oIE, 0)
Local $oQuery = _IEFormElementGetCollection($oForm, 4)
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
Sleep(2000)
_IEFormSubmit($oForm)
