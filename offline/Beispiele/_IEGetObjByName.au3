#include <IE.au3>
#include <MsgBoxConstants.au3>

;Öffnet einen Browser mit dem form-Beispiel und bekommt einen Objektbezug zu dem Element mit dem Namen "ExampleForm". In diesem Fall ist das Ergebnis identisch mit $oForm = _IEFormGetObjByName($oIE, "ExampleForm").

Local $oIE = _IE_Example("form")
Local $oForm = _IEGetObjByName($oIE, "ExampleForm")
MsgBox($MB_SYSTEMMODAL, "ExampleForm", _IEPropertyGet($oForm, "innertext") & @CRLF)
