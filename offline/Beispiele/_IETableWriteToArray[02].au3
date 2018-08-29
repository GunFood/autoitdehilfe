;Gleiches Beispiel wie oben, außer dass die Zeilen und Spalten im Ausgabearray vertauscht sind und das Ergebnis mit _ArrayDisplay() dargestellt wird

#include <Array.au3>
#include <IE.au3>

Local $oIE = _IE_Example("table")
Local $oTable = _IETableGetCollection($oIE, 1)
Local $aTableData = _IETableWriteToArray($oTable, True)
_ArrayDisplay($aTableData)

_IEQuit($oIE)
