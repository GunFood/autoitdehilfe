#include <IE.au3>

; Öffnet das iFrame-Beispiel und bekommt den Bezug zu dem iFrame mit dem Namen "iFrameTwo" und Ersetzt seinen HTML-Body.

Local $oIE = _IE_Example("iframe")
Local $oFrame = _IEFrameGetObjByName($oIE, "iFrameTwo")
_IEBodyWriteHTML($oFrame, "Hallo <b><font color=red>iFrame!</font></b>")
_IELoadWait($oFrame)
