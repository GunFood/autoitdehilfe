#include <IE.au3>

; Öffnet einen Browser mit einer Beispiel-Form, bestimmt den Verweis der Form,
; Wählt den byIndex-Wert der Checkboxen aus und  wieder ab. Wenn $s_Name nicht spezifiziert ist, arbeitet es
; Mit der Auswahl aller <input type=checkbox> Elemente in der Form
; Es ist folgendes zu beachten: Es muss wahrscheinlich in der Seite runtergescrollt werden um die Veränderungen zu sehen

Local $oIE = _IE_Example("Form")
Local $oForm = _IEFormGetObjByName($oIE, "Beispiel-Form")
For $i = 1 To 5
	_IEFormElementCheckBoxSelect($oForm, 3, "", 1, "byIndex")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, 2, "", 1, "byIndex")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, 1, "", 1, "byIndex")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, 0, "", 1, "byIndex")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, 3, "", 0, "byIndex")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, 2, "", 0, "byIndex")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, 1, "", 0, "byIndex")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, 0, "", 0, "byIndex")
	Sleep(1000)
Next

_IEQuit($oIE)
