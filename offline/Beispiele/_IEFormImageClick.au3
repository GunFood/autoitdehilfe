#include <IE.au3>

; Öffnet einen Browser mit dem form-Beispiel; Klick auf das <input type=image> Formularelement mit übereinstimmendem Alternativtext ("alt")

Local $oIE = _IE_Example("form")
_IEFormImageClick($oIE, "AutoIt Homepage", "alt")
