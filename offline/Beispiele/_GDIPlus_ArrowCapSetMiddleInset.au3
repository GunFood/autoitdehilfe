#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>

Example()

Func Example()
	Local $hGui, $hGraphic, $hPen, $hEndCap, $iInset

	; Erzeugt die GUI
	$hGui = GUICreate("GDI+", 400, 330)
	GUISetState(@SW_SHOW)

	; Erzeugt die Ressourcen
	_GDIPlus_Startup()
	$hGraphic = _GDIPlus_GraphicsCreateFromHWND($hGui)
	$hPen = _GDIPlus_PenCreate(0xFF000000, 4)
	$hEndCap = _GDIPlus_ArrowCapCreate(8, 6)

	; Pfeildimensionen anzeigen
	_GDIPlus_GraphicsDrawString($hGraphic, 'Pfeillänge (height) = ' & _GDIPlus_ArrowCapGetHeight($hEndCap) & _
			' ;  Pfeilbreite (width) = ' & _GDIPlus_ArrowCapGetWidth($hEndCap), 10, 2)

	; Zeichne Pfeil 1 (Dreiecksform)
	$iInset = 0
	_GDIPlus_GraphicsDrawString($hGraphic, 'Versatz = ' & $iInset & '   (Dreiecksform)', 10, 30)
	_GDIPlus_ArrowCapSetMiddleInset($hEndCap, $iInset)
	_GDIPlus_PenSetCustomEndCap($hPen, $hEndCap)
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 50, 390, 50, $hPen)

	; Zeichne Pfeil 2 (kräftiger Pfeil)
	$iInset = 2
	_GDIPlus_GraphicsDrawString($hGraphic, 'Versatz = ' & $iInset & '   (Kräftiger Pfeil)', 10, 70)
	_GDIPlus_ArrowCapSetMiddleInset($hEndCap, $iInset)
	_GDIPlus_PenSetCustomEndCap($hPen, $hEndCap)
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 90, 390, 90, $hPen)

	; Zeichne Pfeil 3 (schlanker Pfeil)
	$iInset = 5
	_GDIPlus_GraphicsDrawString($hGraphic, 'Versatz = ' & $iInset & '   (Schlanker Pfeil)', 10, 110)
	_GDIPlus_ArrowCapSetMiddleInset($hEndCap, $iInset)
	_GDIPlus_PenSetCustomEndCap($hPen, $hEndCap)
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 130, 390, 130, $hPen)

	; Zeichne Pfeil 4 (Drachenviereck)
	$iInset = -3.5
	_GDIPlus_GraphicsDrawString($hGraphic, 'Versatz = ' & $iInset & '   (Drachenviereck)', 10, 150)
	_GDIPlus_ArrowCapSetMiddleInset($hEndCap, $iInset)
	_GDIPlus_PenSetCustomEndCap($hPen, $hEndCap)
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 170, 390, 170, $hPen)

	; Zeichne Pfeil 5 (Diamant bzw Rhomboid)
	$iInset = -8
	_GDIPlus_GraphicsDrawString($hGraphic, 'Versatz = ' & $iInset & '   (Diamant bzw Rhomboid)', 10, 190)
	_GDIPlus_ArrowCapSetMiddleInset($hEndCap, $iInset)
	_GDIPlus_PenSetCustomEndCap($hPen, $hEndCap)
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 210, 390, 210, $hPen)

	; Zeichne Pfeil 6 (Versatz zu groß = kein Pfeil)
	$iInset = 9
	_GDIPlus_GraphicsDrawString($hGraphic, 'Versatz = ' & $iInset & '   (Versatz zu groß = kein Pfeil)', 10, 230)
	_GDIPlus_ArrowCapSetMiddleInset($hEndCap, $iInset)
	_GDIPlus_PenSetCustomEndCap($hPen, $hEndCap)
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 250, 390, 250, $hPen)

	; Zeichne Pfeil 7 (Pfeil nicht gefüllt)
	$iInset = 1.5
	_GDIPlus_GraphicsDrawString($hGraphic, 'Versatz = ' & $iInset & '   (FillState = False, also keine Kontur)', 10, 270)
	_GDIPlus_ArrowCapSetFillState($hEndCap, False)
	_GDIPlus_ArrowCapSetMiddleInset($hEndCap, $iInset)
	_GDIPlus_PenSetCustomEndCap($hPen, $hEndCap)
	_GDIPlus_GraphicsDrawLine($hGraphic, 10, 290, 390, 290, $hPen)

	; Auf Schließen des GUI warten
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	; Ressourcen freigeben
	_GDIPlus_ArrowCapDispose($hEndCap)
	_GDIPlus_PenDispose($hPen)
	_GDIPlus_GraphicsDispose($hGraphic)
	_GDIPlus_Shutdown()
EndFunc   ;==>Example
