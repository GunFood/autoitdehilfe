#include <IE.au3>

; Öffnet einen Browser mit der Grundlagen-Beispiel-Seite.
; Fügt ein Event-Script in den Header des Dokuments ein, welches einen JavaScript-Alarm auslöst, wann immer auf das Dokument geklickt wird.

Local $oIE = _IE_Example("basic")
_IEHeadInsertEventScript($oIE, "document", "onclick", "alert('Jemand hat auf das Dokument geklickt!');")
