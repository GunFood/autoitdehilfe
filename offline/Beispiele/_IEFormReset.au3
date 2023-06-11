#include <IE.au3>

; Öffnet einen Browser mit dem Beipielformular, schreibt in ein Formularfeld und setzt das Formular zurück auf die Standardwerte.

Local $oIE = _IE_Example("form")
Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oText = _IEFormElementGetObjByName($oForm, "textExample")
_IEFormElementSetValue($oText, "Hey! It works!")
Sleep(2000)
_IEFormReset($oForm)
