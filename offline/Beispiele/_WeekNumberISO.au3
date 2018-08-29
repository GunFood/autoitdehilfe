#include <Date.au3>
#include <MsgBoxConstants.au3>

MsgBox($MB_SYSTEMMODAL, "Aktuelle Woche", "Wir haben die " & _WeekNumberISO() & ". Woche des Jahres.")
