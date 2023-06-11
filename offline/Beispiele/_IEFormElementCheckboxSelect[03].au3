#include <IE.au3>

; Öffnet einen Browser mit der Beispiel-Form, bestimmt den Verweis der Form,
; Wählt die byIndex-Werte der Checkboxen in der Gruppe, die sich den Namen  checkboxG2Example teilt, aus und wieder ab
; Es ist folgendes zu beachten: Es muss wahrscheinlich in der Seite runtergescrollt werden um die Veränderungen zu sehen

Local $oIE = _IE_Example("Form")
Local $oForm = _IEFormGetObjByName($oIE, "Beispiel-Form")
For $i = 1 To 5
	_IEFormElementCheckBoxSelect($oForm, 0, "checkboxG2Example", 1, "byIndex")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, 1, "checkboxG2Example", 1, "byIndex")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, 0, "checkboxG2Example", 0, "byIndex")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, 1, "checkboxG2Example", 0, "byIndex")
	Sleep(1000)
Next

_IEQuit($oIE)
