#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <SendMessage.au3>
#include <StaticConstants.au3>
#include <WinAPIGdi.au3>
#include <WinAPIGdiDC.au3>
#include <WinAPIHObj.au3>
#include <WinAPIIcons.au3>
#include <WinAPIShPath.au3>

; Systembildliste initialisieren
_WinAPI_FileIconInit()

; Abrufen der Systembildliste und Berechnung der Bitmap-Größe
Local $hImageList = _WinAPI_ShellGetImageList()
If @error Then Exit

Local $iCount = _GUIImageList_GetImageCount($hImageList)
Local $a_iSize = _GUIImageList_GetIconSize($hImageList)
Local $iCX = Sqrt($iCount)
Local $iCY
If $iCX Then
	$iCX = Ceiling($iCX)
	$iCY = Ceiling($iCount / $iCX)
Else
	$iCX = 1
	$iCY = 1
EndIf
Local $W = $iCX * ($a_iSize[0] + 14)
Local $H = $iCY * ($a_iSize[1] + 14)

; GUI erstellen
Local $hForm = GUICreate('Test ' & StringReplace(@ScriptName, '.au3', '()'), $W, $H)
Local $idPic = GUICtrlCreatePic('', 0, 0, $W, $H)
Local $hPic = GUICtrlGetHandle($idPic)

; Bitmap erstellen
Local $hDC = _WinAPI_GetDC($hPic)
Local $hMemDC = _WinAPI_CreateCompatibleDC($hDC)
Local $hBitmap = _WinAPI_CreateCompatibleBitmap($hDC, $W, $H)
Local $hMemSv = _WinAPI_SelectObject($hMemDC, $hBitmap)

; Zeichnen aller Icons aus der Systembildliste in eine Bitmap
Local $iIndex = 0
For $y = 1 To $iCY
	For $x = 1 To $iCX
		_GUIImageList_Draw($hImageList, $iIndex, $hMemDC, ($x - 1) * ($a_iSize[0] + 14) + 7, ($y - 1) * ($a_iSize[0] + 14) + 7)
		$iIndex += 1
		If $iIndex >= $iCount Then
			ExitLoop
		EndIf
	Next
Next

; Objekte freigeben
_WinAPI_ReleaseDC($hPic, $hDC)
_WinAPI_SelectObject($hMemDC, $hMemSv)
_WinAPI_DeleteDC($hMemDC)

; Bitmap zur Kontrolle einstellen
_SendMessage($hPic, $STM_SETIMAGE, 0, $hBitmap)
Local $hObj = _SendMessage($hPic, $STM_GETIMAGE)
If $hObj <> $hBitmap Then
	_WinAPI_DeleteObject($hBitmap)
EndIf

; GUI anzeigen
GUISetState(@SW_SHOW)

Do
Until GUIGetMsg() = $GUI_EVENT_CLOSE
