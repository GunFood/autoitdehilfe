;Öffnet eine Browser-Instanz mit dem Formularbeispiel und erhält einen Bezug zum Formularelement "Text".
;Erhält die Koordinaten und die Abmaße vom Textbereich, umfährt seine Kontur mit der Maus und bewegt sich zum Schluß in die Mitte des Formularelements

#include <IE.au3>

Local $oIE = _IE_Example("form")

Local $oForm = _IEFormGetObjByName($oIE, "ExampleForm")
Local $oTextArea = _IEFormElementGetObjByName($oForm, "textareaExample")

; Erhält die Koordinaten und Abmaße vom Textbereich
Local $iScreenX = _IEPropertyGet($oTextArea, "screenx")
Local $iScreenY = _IEPropertyGet($oTextArea, "screeny")
Local $iWidth = _IEPropertyGet($oTextArea, "width")
Local $iHeight = _IEPropertyGet($oTextArea, "height")

; Umfährt seine Kontur mit der Maus und bewegt sich zum Schluß in die Mitte des Formularelements
Local $iMousespeed = 50
MouseMove($iScreenX, $iScreenY, $iMousespeed)
MouseMove($iScreenX + $iWidth, $iScreenY, $iMousespeed)
MouseMove($iScreenX + $iWidth, $iScreenY + $iHeight, $iMousespeed)
MouseMove($iScreenX, $iScreenY + $iHeight, $iMousespeed)
MouseMove($iScreenX, $iScreenY, $iMousespeed)
MouseMove($iScreenX + $iWidth / 2, $iScreenY + $iHeight / 2, $iMousespeed)
