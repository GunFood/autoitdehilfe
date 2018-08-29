#include <IE.au3>

; Stellt den Verweis auf ein bestimmtes Formular-Feld fest und ändert seinen Wert.
; Anschließend wird eine Abfrage in der Google Suchmaschine gestartet

Local $oIE = _IECreate("http://www.google.com")
Local $oForm = _IEFormGetCollection($oIE, 0)
Local $oQuery = _IEFormElementGetCollection($oForm, 4)
_IEFormElementSetValue($oQuery, "AutoIt IE.au3")
_IEFormSubmit($oForm)
