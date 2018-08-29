#include <IE.au3>

; Öffnet einen Browser mit der Grundlagen-Beispiel-Seite.
; Fügt ein Event-Script in den Header des Dokuments ein, welches einen JavaScript Alarm auslöst, wann immer auf das Dokument ein Rechtsklick ausgeführt wird.
; In diesem Fall soll das Event-Script "False" zurückgeben, um zu verhindern, dass das Rechtsklick-Kontextmenü aufgerufen wird.

Local $oIE = _IE_Example("basic")
_IEHeadInsertEventScript($oIE, "document", "oncontextmenu", "alert('Kein Kontextmenü');return false")
