; Öffnet einen Browser mit einer Beispiel-Form, bestimmt den Verweis der Form,
; Wählt den byValue-Wert der Checkboxen aus und  wieder ab.
; Wenn $s_Name nicht spezifiziert ist, arbeitet es mit der Auswahl aller <input type=checkbox> Elemente in der Form.
; Es ist folgendes zu beachten: Es muss wahrscheinlich in der Seite runtergescrollt werden um die Veränderungen zu sehen

#include <IE.au3>

Local $oIE = _IE_Example("Form")
Local $oForm = _IEFormGetObjByName($oIE, "Beispiel-Form")
For $i = 1 To 3
	_IEFormElementCheckBoxSelect($oForm, "Basketball", "", 1, "byValue")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, "Fußball", "", 1, "byValue")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, "Tennis", "", 1, "byValue")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, "Baseball", "", 1, "byValue")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, "Basketball", "", 0, "byValue")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, "Fußball", "", 0, "byValue")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, "Tennis", "", 0, "byValue")
	Sleep(1000)
	_IEFormElementCheckBoxSelect($oForm, "Baseball", "", 0, "byValue")
	Sleep(1000)
Next

_IEQuit($oIE)
