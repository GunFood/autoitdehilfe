#include <IE.au3>

; Öffnet einen Browser mit dem Grundbeispiel, liest den HTML-Code innerhalb des <body>-Tags des Dokumentes.
; Dann wird eine neue HTML-Quelltextzeile dem Original hinzugefügt und zurück in den Browser geschrieben.

Local $oIE = _IE_Example("basic")
Local $sHTML = _IEBodyReadHTML($oIE)
$sHTML = $sHTML & "<p><font color=red size=+5>Big RED text!</font>"
_IEBodyWriteHTML($oIE, $sHTML)
