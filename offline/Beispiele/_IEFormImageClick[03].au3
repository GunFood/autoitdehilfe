#include <IE.au3>

; Öffnet einen Browser mit dem form-Beispiel; Klick auf das <input type=image> Formularelement mit übereinstimmendem Namen

Local $oIE = _IE_Example("form")
_IEFormImageClick($oIE, "imageExample", "name")
