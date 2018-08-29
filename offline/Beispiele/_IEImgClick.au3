#include <IE.au3>

; Klickt auf ein Bild (Tag img) anhand eines Alternativtextes (Attribut alt)

Local $oIE = _IE_Example("basic")
_IEImgClick($oIE, "AutoIt Homepage Image", "alt")
