#include <IE.au3>

;Verbindung zu einem eingebetteten IE-Control herstellen, dessen Fenstertitel "Ein Fenstertitel" enthält.

Local $oIE = _IEAttach("Ein Fenstertitel", "embedded")
ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $oIE = ' & $oIE & @CRLF & '>Error code: ' & @error & '    Extended code: 0x' & Hex(@extended) & @CRLF) ;### Debug Console
