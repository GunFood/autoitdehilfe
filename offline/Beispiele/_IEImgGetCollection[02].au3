#include <IE.au3>
#include <MsgBoxConstants.au3>

; Erstellt eine Browser-Instanz und lädt die englische AutoIt Seite, erfasst alle Bilder und stellt für jedes Bild die Url in einer MsgBox dar

Local $oIE = _IECreate("http://www.autoitscript.com/")
Local $oImgs = _IEImgGetCollection($oIE)
Local $iNumImg = @extended

Local $sTxt = "Es sind " & $iNumImg & " Bilder auf der Seite" & @CRLF & @CRLF
For $oImg In $oImgs
	$sTxt &= $oImg.src & @CRLF
Next
MsgBox($MB_SYSTEMMODAL, "Bild-Info", $sTxt)

_IEQuit($oIE)
