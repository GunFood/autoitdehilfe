; Dieses Beispiel macht eine Suche auf dem GPIB-Bus und zeigt das Ergebnis in einer MsgBox.

#include <Visa.au3>

Local $a_descriptor_list[1], $a_idn_list[1]
_viFindGpib($a_descriptor_list, $a_idn_list, 1)
