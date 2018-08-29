#include <IE.au3>
#include <MsgBoxConstants.au3>

; Öffnet einen Browser mit dem Grundbeispiel, liest den HTML-Quelltext des Dokuments (kompletten HTML-Quelltext einschließlich dem <HEAD> und dem Code) und stellt ihn in einer MsgBox dar.

Local $oIE = _IE_Example("basic")
Local $sHTML = _IEDocReadHTML($oIE)
MsgBox($MB_SYSTEMMODAL, "Document Source", $sHTML)

_IEQuit($oIE)
