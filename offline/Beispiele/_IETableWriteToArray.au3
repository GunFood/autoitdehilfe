; Öffnet den Browser mit der Beispieltabelle, erhält einen Bezug zur zweiten Tabelle auf der Seite(Index 1) und liest deren Intalt in ein 2D Array

#include <Array.au3>
#include <IE.au3>

Local $oIE = _IE_Example("table")
Local $oTable = _IETableGetCollection($oIE, 1)
Local $aTableData = _IETableWriteToArray($oTable)

_ArrayDisplay($aTableData)

_IEQuit($oIE)
