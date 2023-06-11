#include <IE.au3>

;Verbindet sich mit dem 3. IE-Control, das in ein anderes Fenster eingebettet ist.
;Benutzt die erweiterte Fenstertitelsyntax, um das 2. Fenster mit dem Titel 'ICQ' zu finden.

Local $oIE = _IEAttach("[REGEXPTITLE:ICQ; INSTANCE:2]", "embedded", 3)
MsgBox($MB_SYSTEMMODAL, "Beispiel 4:", _IEPropertyGet($oIE, "locationurl"))
