#include <IE.au3>

; Erstellt einen leeren Browser und schreibt HTML-Text hinein - in diesem Fall ein FRAMESET - und erneuert dann die Inhalte aller Frames.

Local $oIE = _IECreate()
Local $sHTML = ""
$sHTML &= "<HTML>" & @CRLF
$sHTML &= "<HEAD>" & @CRLF
$sHTML &= "<TITLE>_IE_Example('frameset')</TITLE>" & @CRLF
$sHTML &= "</HEAD>" & @CRLF
$sHTML &= "<FRAMESET rows='25,200'>" & @CRLF
$sHTML &= " <FRAME NAME=Top SRC=about:blank>" & @CRLF
$sHTML &= " <FRAMESET cols='100,500'>" & @CRLF
$sHTML &= "   <FRAME NAME=Menu SRC=about:blank>" & @CRLF
$sHTML &= "   <FRAME NAME=Main SRC=about:blank>" & @CRLF
$sHTML &= " </FRAMESET>" & @CRLF
$sHTML &= "</FRAMESET>" & @CRLF
$sHTML &= "</HTML>"
_IEDocWriteHTML($oIE, $sHTML)
_IEAction($oIE, "refresh")
Local $oFrameTop = _IEFrameGetObjByName($oIE, "Top")
Local $oFrameMenu = _IEFrameGetObjByName($oIE, "Menu")
Local $oFrameMain = _IEFrameGetObjByName($oIE, "Main")
_IEBodyWriteHTML($oFrameTop, '$oFrameTop = _IEFrameGetObjByName($oIE, "Top")')
_IEBodyWriteHTML($oFrameMenu, '$oFrameMenu = _IEFrameGetObjByName($oIE, "Menu")')
_IEBodyWriteHTML($oFrameMain, '$oFrameMain = _IEFrameGetObjByName($oIE, "Main")')
