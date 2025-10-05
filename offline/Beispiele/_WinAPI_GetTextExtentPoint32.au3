#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <SendMessage.au3>
#include <WinAPIGdi.au3>
#include <WinAPIGdiDC.au3>
#include <WinAPIHObj.au3>
#include <WindowsNotifsConstants.au3>

Example()

Func Example()
	Local $hGui = GUICreate("String Höhe & Breite.")
	GUISetState(@SW_SHOW, $hGui)

	Local $sText = "Das ist ein wenig Text" ; Der Text von dem man die Höhe und Breite haben möchte.
	Local $aStringDimension = GetStringDimensions($hGui, $sText) ; Gibt ein 1 Dimensionales Array zurück indem $aArray[0] gleich Breite und $aArray[1] gleich Höhe ist.

	MsgBox($MB_SYSTEMMODAL, "String Höhe und Breite", 'Die Höhe und Breite des Strings "' & $sText & '" ist:' & @CRLF & _
			"Breite: " & $aStringDimension[0] & @CRLF & _
			"Höhe: " & $aStringDimension[1] & @CRLF)
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

Func GetStringDimensions($hWnd, $sText)
	Local $hDC = _WinAPI_GetDC($hWnd) ; Holt den Device-Context des aktuellen Fensters
	Local $hFont = _SendMessage($hWnd, $WM_GETFONT) ; Ermittelt die Schriftart die benutzt wurde, womit das Control den Text schreibt
	Local $hSelectObject = _WinAPI_SelectObject($hDC, $hFont) ; Markiert das Objekt vom Context-Device
	Local $tSIZE = _WinAPI_GetTextExtentPoint32($hDC, $sText) ; Ermittelt die Höhe und Breite des Strings.

	_WinAPI_SelectObject($hDC, $hSelectObject)
	_WinAPI_ReleaseDC($hWnd, $hDC) ; Release den Device-Context
	Local $aReturn[2] = [DllStructGetData($tSIZE, 1), DllStructGetData($tSIZE, 2)] ; Gibt die Höhe und Breite als Array zurück
	Return $aReturn
EndFunc   ;==>GetStringDimensions
