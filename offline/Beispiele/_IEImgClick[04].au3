#include <IE.au3>

; Klickt auf ein Bild (IMG) anhand eines kompletten Strings des Quelltextes

Local $oIE = _IE_Example("basic")
_IEImgClick($oIE, "http://www.autoitscript.com/images/logo_autoit_210x72.png")
