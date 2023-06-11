#include <FrameConstants.au3>
#include <GUIConstantsEx.au3>
#include <WinAPI.au3>

Global $hGUI = GUICreate("_WinAPI_DrawFrameControl", 400, 300)

GUISetState(@SW_SHOW)

Example()

Func Example()
	Local $hDC = _WinAPI_GetWindowDC($hGUI)
	Local $tRect = DllStructCreate($tagRECT)
	;     Local $ptrRect = DllStructGetPtr($tRect)

	_SetPosSize($tRect, 20, 45, 22, 22)
	_WinAPI_DrawFrameControl($hDC, $tRect, $DFC_BUTTON, $DFCS_BUTTONCHECK + $DFCS_CHECKED)

	_SetPosSize($tRect, 50, 45, 22, 22)
	_WinAPI_DrawFrameControl($hDC, $tRect, $DFC_BUTTON, $DFCS_BUTTONRADIO + $DFCS_CHECKED)

	_SetPosSize($tRect, 80, 40, 32, 32)
	_WinAPI_DrawFrameControl($hDC, $tRect, $DFC_CAPTION, $DFCS_CAPTIONCLOSE)

	Local $aState[9] = [8, $DFCS_BUTTON3STATE, $DFCS_BUTTON3STATE + $DFCS_INACTIVE, $DFCS_BUTTONCHECK, $DFCS_BUTTONPUSH, $DFCS_BUTTONPUSH + $DFCS_FLAT, $DFCS_BUTTONRADIO, $DFCS_BUTTONRADIOIMAGE, $DFCS_BUTTONRADIOMASK]
	For $i = 1 To $aState[0]
		_SetPosSize($tRect, $i * 25, 100, 15, 15)
		_WinAPI_DrawFrameControl($hDC, $tRect, $DFC_BUTTON, $aState[$i])
	Next

	Local $aState[6] = [5, $DFCS_CAPTIONCLOSE + $DFCS_HOT, $DFCS_CAPTIonhelp + $DFCS_PUSHED, $DFCS_CAPTIONMAX, $DFCS_CAPTIONMIN, $DFCS_CAPTIONRESTORE]
	For $i = 1 To $aState[0]
		_SetPosSize($tRect, $i * 25, 130, 22, 22)
		_WinAPI_DrawFrameControl($hDC, $tRect, $DFC_CAPTION, $aState[$i])
	Next

	Local $aState[5] = [4, $DFCS_MENUARROW + $DFCS_TRANSPARENT, $DFCS_MENUARROWRIGHT, $DFCS_MENUBULLET, $DFCS_MENUCHECK]
	For $i = 1 To $aState[0]
		_SetPosSize($tRect, $i * 25, 160, 22, 22)
		_WinAPI_DrawFrameControl($hDC, $tRect, $DFC_MENU, $aState[$i])
	Next

	Local $aState[5] = [4, $DFCS_MENUARROW + $DFCS_TRANSPARENT, $DFCS_MENUARROWRIGHT, $DFCS_MENUBULLET, $DFCS_MENUCHECK]
	For $i = 1 To $aState[0]
		_SetPosSize($tRect, $i * 25 + 120, 160, 22, 22)
		_WinAPI_DrawFrameControl($hDC, $tRect, $DFC_POPUPMENU, $aState[$i])
	Next

	Local $aState[9] = [8, $DFCS_SCROLLCOMBOBOX, $DFCS_SCROLLDOWN, $DFCS_SCROLLLEFT, $DFCS_SCROLLRIGHT, $DFCS_SCROLLSIZEGRIP, $DFCS_SCROLLSIZEGRIPRIGHT, $DFCS_SCROLLUP, $DFCS_ADJUSTRECT]
	For $i = 1 To $aState[0]
		_SetPosSize($tRect, $i * 25, 190, 22, 22)
		_WinAPI_DrawFrameControl($hDC, $tRect, $DFC_SCROLL, $aState[$i])
	Next

	_WinAPI_ReleaseDC($hGUI, $hDC) ; Muss nach _WinAPI_GetWindowDC() oder _WinAPI_GetDC() aufgerufen werden.

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Hilfs-Funktion zum Setzen der Position und Größe des gezeichneten Controls.
Func _SetPosSize($tRect, $iLeft, $iTop, $iWidth, $iHeight)
	DllStructSetData($tRect, "Left", $iLeft)
	DllStructSetData($tRect, "Top", $iTop)
	DllStructSetData($tRect, "Right", $iLeft + $iWidth)
	DllStructSetData($tRect, "Bottom", $iTop + $iHeight)
EndFunc   ;==>_SetPosSize
