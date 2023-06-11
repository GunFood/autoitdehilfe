#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <WinAPISysWin.au3>

Example()

Func Example()
	Local $iMsg, $idBtnFocus, $hWin, $sText
	GUICreate("__WinAPI_GetFocus Beispiel", 300, 200)
	$idBtnFocus = GUICtrlCreateButton("Fokus ermitteln", 50, 85, 100, 30)
	GUISetState(@SW_SHOW)
	While 1
		$iMsg = GUIGetMsg()
		Select
			Case $iMsg = $GUI_EVENT_CLOSE
				Exit
			Case $iMsg = $idBtnFocus
				$hWin = _WinAPI_GetFocus()
				$sText = "Kompletter Titel: " & WinGetTitle($hWin) & @CRLF
				$sText &= "Kompletter Text: " & WinGetText($hWin) & @CRLF
				$sText &= "Handle: " & WinGetHandle($hWin) & @CRLF
				$sText &= "Prozess: " & WinGetProcess($hWin) & @CRLF
				MsgBox($MB_SYSTEMMODAL, "", $sText)
		EndSelect
	WEnd
EndFunc   ;==>Example
