#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <ScreenCapture.au3>
#include <WinAPIHObj.au3>

; Erstellt eine GUI
Local $hWnd = GUICreate("GDI+ Beispiel (" & @ScriptName & ")", 500, 500)
GUISetState(@SW_SHOW)

; Startet GDI+
_GDIPlus_Startup()
Local $hGraphics = _GDIPlus_GraphicsCreateFromHWND($hWnd)
_GDIPlus_GraphicsClear($hGraphics)

; Erstellt einen Screenshot der unteren linken Ecke des Bildschirms
Local $hScreenCap_hBitmap = _ScreenCapture_Capture("", 0, @DesktopHeight - 500, 500, @DesktopHeight)
Local $hScreenCap_Bitmap = _GDIPlus_BitmapCreateFromHBITMAP($hScreenCap_hBitmap)

Local $hMatrix = _GDIPlus_MatrixCreate()
; Verdoppelt die Matrix
_GDIPlus_MatrixScale($hMatrix, 2.0, 2.0)


_GDIPlus_GraphicsSetTransform($hGraphics, $hMatrix)
_GDIPlus_GraphicsDrawImageRect($hGraphics, $hScreenCap_Bitmap, 0, 0, 500, 500)

Do
Until GUIGetMsg() = $GUI_EVENT_CLOSE

; Ressourcen freigeben
_WinAPI_DeleteObject($hScreenCap_hBitmap)
_GDIPlus_BitmapDispose($hScreenCap_Bitmap)
_GDIPlus_MatrixDispose($hMatrix)
_GDIPlus_GraphicsDispose($hGraphics)
_GDIPlus_Shutdown()
