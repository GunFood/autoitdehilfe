#include <MsgBoxConstants.au3>
#include <WinAPIGdi.au3>
#include <WinAPIGdiDC.au3>
#include <WinAPIHObj.au3>
#include <WinAPISysWin.au3>

If Not @Compiled Then Exit MsgBox($MB_ICONWARNING, "_WinAPI_CreatePen Beispielskript", _
		"Wenn das Skript von SciTE aus ausgeführt wird, funktioniert es nicht richtig, weil SciTE den Bildschirm aktualisiert. Daher wird das Kreuz nicht vollständig gezeichnet und verschwindet in einem Sekundenbruchteil!" & _
		@CRLF & @CRLF & "Bitte das Skript kompilieren und die Exe ausführen.")

ShowCross(@DesktopWidth / 2, @DesktopHeight / 2, 20, 2, 0xFF, 3000)

Func ShowCross($iStart_x, $iStart_y, $iLength, $iWidth, $iColor, $iTime)
	Local $hDC, $hPen, $o_Orig

	$hDC = _WinAPI_GetWindowDC(0) ; Gerätekontext (DC) des gesamten Bildschirms (Desktop)
	$hPen = _WinAPI_CreatePen($PS_SOLID, $iWidth, $iColor)
	$o_Orig = _WinAPI_SelectObject($hDC, $hPen)

	_WinAPI_DrawLine($hDC, $iStart_x - $iLength, $iStart_y, $iStart_x - 5, $iStart_y) ; Horizontal links
	_WinAPI_DrawLine($hDC, $iStart_x + $iLength, $iStart_y, $iStart_x + 5, $iStart_y) ; Horizontal rechts
	_WinAPI_DrawLine($hDC, $iStart_x, $iStart_y - $iLength, $iStart_x, $iStart_y - 5) ; Vertikal oben
	; _WinAPI_DrawLine($hDC, $iStart_x, $iStart_y + $iLength, $iStart_x, $iStart_y + 5) ;  Vertikal unten
	_WinAPI_MoveTo($hDC, $iStart_x, $iStart_y + $iLength)
	_WinAPI_LineTo($hDC, $iStart_x, $iStart_y + 5)

	Sleep($iTime) ; Zeigt das Kreuz für die im Funktionsaufruf angegebene Zeit (in ms)

	; Desktop neu zeichnen (lösche das Kreuz)
	_WinAPI_RedrawWindow(_WinAPI_GetDesktopWindow(), 0, 0, $RDW_INVALIDATE + $RDW_ALLCHILDREN)

	; Ressourcen freigeben
	_WinAPI_SelectObject($hDC, $o_Orig)
	_WinAPI_DeleteObject($hPen)
	_WinAPI_ReleaseDC(0, $hDC)
EndFunc   ;==>ShowCross
