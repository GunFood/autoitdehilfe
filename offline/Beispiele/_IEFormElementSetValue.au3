#include <IE.au3>

; Öffnet einen Browser mit dem Formular-Beispiel und ändert den Wert eines Textfeldes

Local $oIE = _IE_Example("form")
Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oText = _IEFormElementGetObjByName($oForm, "textExample")
_IEFormElementSetValue($oText, "Hey! Es funktioniert!")
