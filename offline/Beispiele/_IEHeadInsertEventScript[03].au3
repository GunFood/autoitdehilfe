#include <IE.au3>

; Öffnet einen Browser mit der Grundlagen-Beispiel-Seite,
; fügt ein Event-Script in den Header des Dokuments ein, welches einen JavaScript Alarm auslöst,
; wenn man die Seite verlassen will und die Möglichkeit des Abbruchs der Aktion anbietet.

$oIE = _IE_Example("basic")
_IEHeadInsertEventScript($oIE, "window", "onbeforeunload", _
		"alert('Beispiel-Warnung folgt...');return 'Änderungen könnten verloren gehen!';")
_IENavigate($oIE, "www.autoit.de")
