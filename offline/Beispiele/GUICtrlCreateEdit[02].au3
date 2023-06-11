#Include <StaticConstants.au3>
#Include <MsgBoxConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $oMyError

RichEditExample()

; RichEdit-Control-Beispiel unter Nutzung von GUICtrlCreateObj

; Author: Klre Johansson
; AutoIt Version: 3.1.1.55
; Description: Very Simple example: Embedding RICHTEXT object
; Needs: MSCOMCT2.OCX in system32 but it's probably already there
; Date: 3 jul 2005
Func RichEditExample()
	Local $oRP, $TagsPageC, $AboutC, $PrefsC, $StatC, $GUIActiveX, $msg

	$oMyError = ObjEvent("AutoIt.Error", "MyErrFunc")

	$oRP = ObjCreate("RICHTEXT.RichtextCtrl.1")

	GUICreate("Eingebettetes RICHTEXT", 320, 200, -1, -1, BitOR($WS_OVERLAPPEDWINDOW, $WS_CLIPSIBLINGS, $WS_CLIPCHILDREN))
	$TagsPageC = GUICtrlCreateLabel('Besuch der Tags-Seite', 5, 180, 100, 15, $SS_CENTER)
	GUICtrlSetFont($TagsPageC, 9, 400, 4)
	GUICtrlSetColor($TagsPageC, 0x0000ff)
	GUICtrlSetCursor($TagsPageC, 0)
	$AboutC = GUICtrlCreateButton('Über', 105, 177, 70, 20)
	$PrefsC = GUICtrlCreateButton('Schriftgröße', 175, 177, 70, 20)
	$StatC = GUICtrlCreateButton('leerer Stil', 245, 177, 70, 20)

	$GUIActiveX = GUICtrlCreateObj($oRP, 10, 10, 400, 260)
	GUICtrlSetPos($GUIActiveX, 10, 10, 300, 160)

	With $oRP; ObjeKt tag Pool
		.OLEDrag()
		.Font = 'Arial'
		.text = "Hallo - Au3 unterstützt ActiveX-Komponenten wie RICHTEXT. Dank an SvenP!" & @CRLF & 'Versuche etwas Text zu schreiben und ihn neu zu laden.'
		;.FileName = @ScriptDir & '\RichText.rtf'
		;.BackColor = 0xff00
	EndWith

	GUISetState(@SW_SHOW) ; GUI anzeigen

	While 1
		$msg = GUIGetMsg()

		Select
			Case $msg = $GUI_EVENT_CLOSE
				$oRP.SaveFile(@ScriptDir & "\RichText.rtf", 0)
				ExitLoop
			Case $msg = $TagsPageC
				Run(@ComSpec & ' /c start http://www.myplugins.info/guids/typeinfo/typeinfo.php?clsid={3B7C8860-D78F-101B-B9B5-04021C009402}', '', @SW_HIDE)
			Case $msg = $AboutC
				$oRP.AboutBox()
			Case $msg = $PrefsC
				$oRP.SelFontSize = 12
			Case $msg = $StatC
				$oRP.SelBold = False
				$oRP.SelItalic = False
				$oRP.SelUnderline = False
				$oRP.SelFontSize = 8
		EndSelect
	WEnd
	GUIDelete()
EndFunc   ;==>RichEditExample

Func MyErrFunc()

	MsgBox($MB_SYSTEMMODAL, "AutoItCOM-Test", "Wir haben einen COM-Fehler abgefangen!" & @CRLF & @CRLF & _
			"err.description: " & @TAB & $oMyError.description & @CRLF & _
			"err.windescription:" & @TAB & $oMyError.windescription & @CRLF & _
			"err.number: " & @TAB & Hex($oMyError.number, 8) & @CRLF & _
			"err.lastdllerror: " & @TAB & $oMyError.lastdllerror & @CRLF & _
			"err.scriptline: " & @TAB & $oMyError.scriptline & @CRLF & _
			"err.source: " & @TAB & $oMyError.source & @CRLF & _
			"err.helpfile: " & @TAB & $oMyError.helpfile & @CRLF & _
			"err.helpcontext: " & @TAB & $oMyError.helpcontext _
			, 5)
	; Wird nach 5 Sekunden automatisch fortfahren

	Local $err = $oMyError.number
	If $err = 0 Then $err = -1

	SetError($err) ; Zu prüfen, bevor die Funktion endet
EndFunc   ;==>MyErrFunc
