#include <IE.au3>

; Klickt auf ein Bild (IMG) anhand eines Teilstrings des Quelltextes

Local $oIE = _IE_Example("basic")
_IEImgClick($oIE, "autoit_6_240x100.jpg", "src")
