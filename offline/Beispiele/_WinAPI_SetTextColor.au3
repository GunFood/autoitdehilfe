#include <FontConstants.au3>
#include <WinAPIGdi.au3>
#include <WinAPIGdiDC.au3>
#include <WinAPIHObj.au3>
#include <WinAPISysWin.au3>
#include <WindowsConstants.au3>

Global $tRECT, $g_hFont, $g_hOldFont, $g_hDC

HotKeySet("{ESC}", "_Exit")

$tRECT = DllStructCreate($tagRect)
DllStructSetData($tRECT, "Left", 5)
DllStructSetData($tRECT, "Top", 5)
DllStructSetData($tRECT, "Right", 300)
DllStructSetData($tRECT, "Bottom", 50)

$g_hDC = _WinAPI_GetDC(0)
$g_hFont = _WinAPI_CreateFont(50, 0, 0, 0, 400, False, False, False, $DEFAULT_CHARSET, _
		$OUT_DEFAULT_PRECIS, $CLIP_DEFAULT_PRECIS, $DEFAULT_QUALITY, 0, 'Arial')
$g_hOldFont = _WinAPI_SelectObject($g_hDC, $g_hFont)

_WinAPI_SetTextColor($g_hDC, 0x0000FF)
_WinAPI_SetBkColor($g_hDC, 0x000000)
; Kommentiere die nächste Zeile aus, um einen schwarzen statt transparenten Hintergrund zu erhalten.
_WinAPI_SetBkMode($g_hDC, $TRANSPARENT)

While 1
	_WinAPI_DrawText($g_hDC, "www.autoit.de", $tRECT, $DT_CENTER)
	Sleep(7000)
	_Exit()
WEnd

Func _Exit()
	_WinAPI_SelectObject($g_hDC, $g_hOldFont)
	_WinAPI_DeleteObject($g_hFont)
	_WinAPI_ReleaseDC(0, $g_hDC)
	_WinAPI_InvalidateRect(0, 0)
	$tRECT = 0
	Exit
EndFunc   ;==>_Exit
