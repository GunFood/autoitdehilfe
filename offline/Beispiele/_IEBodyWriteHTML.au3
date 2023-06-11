#include <IE.au3>

; Öffnet einen Browser mit dem iFrame-Beispiel, einen Bezug zu dem iFrame mit dem Namen "iFrameTwo" zu bekommen und dessen body-HTML zu ersetzen.

Local $oIE = _IE_Example("iframe")
Local $oFrame = _IEFrameGetObjByName($oIE, "iFrameTwo")
_IEBodyWriteHTML($oFrame, "Hallo <b><font color=red>iFrame!</font></b>")
