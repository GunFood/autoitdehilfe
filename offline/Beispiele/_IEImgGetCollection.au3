#include <IE.au3>
#include <MsgBoxConstants.au3>

; Erstellt eine Browser-Instanz und lädt die englische AutoIt Sseite.
; Der Browser erhält einen Bezug zum sechsten Bild auf der Seite (Merke: das erste Bild hat den Index 0) und stellt Informationen darüber in einer MsgBox dar

Local $oIE = _IECreate("http://www.autoitscript.com/")
Local $oImg = _IEImgGetCollection($oIE, 4)
Local $sInfo = "Url: " & $oImg.src & @CRLF
$sInfo &= "Dateiname: " & $oImg.nameProp & @CRLF
$sInfo &= "Höhe: " & $oImg.height & @CRLF
$sInfo &= "Breite: " & $oImg.width & @CRLF
$sInfo &= "Rand: " & $oImg.border
MsgBox($MB_SYSTEMMODAL, "Infos über das sechste Bild", $sInfo)

_IEQuit($oIE)
