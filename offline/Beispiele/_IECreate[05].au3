; Erstellt ein Browser-Fenster, welches an eine neue Instanz von iexplore.exe angehängt wird.
; Dies ist oft notwendig, um einen neuen Cookie-Kontext der Sitzung zu erhalten.
; (Sitzungs-Cookies sind für alle Browserinstanzen, die die gleiche iexplore.exe verwenden).

#include <IE.au3>

Opt("WinTitleMatchMode", 2)

ShellExecute("iexplore.exe", "about:blank")
WinWait("Windows Internet Explorer")

Local $oIE = _IEAttach("about:blank", "url")
_IELoadWait($oIE)
_IENavigate($oIE, "www.autoitscript.com")
