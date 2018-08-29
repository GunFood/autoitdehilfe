#include <AutoItConstants.au3>

; Verbindet Laufwerk X mit \\myserver\stuff, wobei der aktuelle Benutzer benutzt wird.
DriveMapAdd("X:", "\\myserver\stuff")

; Verbindet Laufwerk X mit \\myserver2\stuff2, wobei der Benutzer "jon" aus "domainx" mit dem Passwort "tickle" benutzt wird.
DriveMapAdd("X:", "\\myserver2\stuff2", $DMA_DEFAULT, "domainx\jon", "tickle")
