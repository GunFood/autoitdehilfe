; Erstellt eine Internet-Explorer-Instanz und lädt eine Internetseite,.
; Anschließend wird 5 Sekunden gewartet und eine andere Internetseite geladen
; Anschließend wird 5 Sekunden gewartet und eine andere Internetseite geladen

#include <IE.au3>

Local $oIE = _IECreate("www.autoitscript.com")
Sleep(5000)
_IENavigate($oIE, "http://www.autoitscript.com/forum/index.php?")
Sleep(5000)
_IENavigate($oIE, "http://www.autoitscript.com/forum/index.php?showforum=9")
