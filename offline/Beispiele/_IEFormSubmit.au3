#include <IE.au3>

; Öffnet einen Browser mit dem form-Beispiel; Formularfeld ausfüllen und absenden

Local $oIE = _IE_Example("form")
Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oText = _IEFormElementGetObjByName($oForm, "textExample")
_IEFormElementSetValue($oText, "Hey! Es funktioniert!")
Sleep(2000)
_IEFormSubmit($oForm)
