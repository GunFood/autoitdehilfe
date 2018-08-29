#include <IE.au3>

; Einfügen von HTML in ein Dokument, am Anfang und Ende

Local $oIE = _IECreate("http://www.autoitscript.com")
Local $oBody = _IETagNameGetCollection($oIE, "body", 0)
_IEDocInsertHTML($oBody, "<h2><font color=red>Dieser HTML-Code ist eingefügt am Anfang</font></h2>", "afterbegin")
_IEDocInsertHTML($oBody, "<h2><font color=red>Dieser HTML-Code ist eingefügt am Ende</font></h2>", "beforeend")
