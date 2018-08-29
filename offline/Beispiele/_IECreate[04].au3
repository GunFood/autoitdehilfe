#include <IE.au3>

; Erstellt ein leeres Browserfenster und versieht es mit eigenem HTML-Text.

Local $oIE = _IECreate()
Local $sHTML = "<h1>Hallo Welt!</h1>"
_IEBodyWriteHTML($oIE, $sHTML)
