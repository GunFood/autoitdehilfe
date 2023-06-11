#include <IE.au3>

; Verbindet sich mit einem geöffneten Internet Explorer, in dessen Hauptdokument der Text "simple HTML page" vorkommt.

Local $oIE_basic = _IE_Example("basic")

Local $oIE = _IEAttach("simple HTML page", "text")
ConsoleWrite('@@ Debug(' & @ScriptLineNumber & ') : $oIE = ' & $oIE & @CRLF & '>Error code: ' & @error & '    Extended code: 0x' & Hex(@extended) & @CRLF) ;### Debug Console
