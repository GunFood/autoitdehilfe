#include <IE.au3>

;Erstellt neue Browserfenster, die 3 verschiedene URL zeigen, auch wenn noch keine existiert ($f_tryAttach = 1) nicht warten, bis die Seite fertig geladen ist ($f_wait = 0).

_IECreate("www.autoitscript.com", 1, 1, 0)
_IECreate("http://www.autoit.de/hilfe/", 1, 1, 0)
_IECreate("www.metager2.de", 1, 1, 0)
