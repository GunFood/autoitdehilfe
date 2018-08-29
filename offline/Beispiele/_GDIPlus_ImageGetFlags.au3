#include <GDIPlus.au3>
#include <GUIConstantsEx.au3>
#include <ScreenCapture.au3>
#include <WinAPIHObj.au3>
#include <WindowsConstants.au3>


Global $g_idMemo

Example()

Func Example()
	Local $hBitmap, $hImage, $aRet

	; Erstellt das GUI
	GUICreate("GDI+", 600, 400)
	$g_idMemo = GUICtrlCreateEdit("", 2, 2, 596, 396, $WS_VSCROLL)
	GUICtrlSetFont($g_idMemo, 9, 400, 0, "Courier New")
	GUISetState(@SW_SHOW)

	; Initialisiert (startet) Microsoft Windows GDI+
	_GDIPlus_Startup()

	; Erstellt vom kompletten Bildschirm einen Screenshot und erzeugt daraus eine 32-bit Bitmap
	$hBitmap = _ScreenCapture_Capture("")
	$hImage = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap)

	; Zeigt die Pixeldaten-Eigenschaften des Screenshots
	$aRet = _GDIPlus_ImageGetFlags($hImage)
	$aRet[1] = @CRLF & StringReplace($aRet[1], "|", @CRLF)
	MemoWrite("Pixeldaten-Eigenschaften des Screenshots: " & $aRet[1]);
	MemoWrite();
	MemoWrite("Integer-Flag-Satz mit Pixeldaten-Attributen: " & $aRet[0]);
	MemoWrite();

	; Speichert den Screenshot (Bitmap) in einer Datei
	_GDIPlus_ImageSaveToFile($hImage, @MyDocumentsDir & "\GDIPlus_Image.jpg")

	; Ressourcen freigeben
	_GDIPlus_ImageDispose($hImage)
	_WinAPI_DeleteObject($hBitmap)

	; Lädt den Screenshot (Bitmap) aus einer Datei
	$hImage = _GDIPlus_ImageLoadFromFile(@MyDocumentsDir & "\GDIPlus_Image.jpg")

	; Zeigt die Pixeldaten-Eigenschaften des abgespeicherten Screenshots (Bitmap)
	$aRet = _GDIPlus_ImageGetFlags($hImage)
	$aRet[1] = @CRLF & StringReplace($aRet[1], "|", @CRLF)
	MemoWrite("Pixeldaten-Eigenschaften der gespeicherten Datei: " & $aRet[1]);
	MemoWrite();
	MemoWrite("Integer-Flag-Satz mit Pixeldaten-Attributen: " & $aRet[0]);

	; Ressourcen freigeben
	_GDIPlus_ImageDispose($hImage)

	; Gibt die durch Microsoft Windows GDI+ verwendeten Ressourcen wieder frei
	_GDIPlus_Shutdown()

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

; Gibt eine Zeile im Memo Fenster aus
Func MemoWrite($sMessage = '')
	GUICtrlSetData($g_idMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite
