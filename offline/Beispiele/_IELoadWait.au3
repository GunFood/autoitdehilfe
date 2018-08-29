#include <IE.au3>

; Öffnet das AutoIt-Forum und springt per Tab zu "Neue Beiträge" startet den Link durch drücken der Enter-Taste
; Dann wird gewartet bis die Seite komplett geladen wurde, bevor das Skript weiterläuft.

Local $oIE = _IECreate("http://www.autoitscript.com/forum/index.php")
Send("{TAB 12}")
Send("{ENTER}")
_IELoadWait($oIE)
