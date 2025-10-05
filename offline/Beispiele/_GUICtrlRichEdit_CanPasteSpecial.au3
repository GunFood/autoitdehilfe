#include <GUIConstantsEx.au3>
#include <GuiMenu.au3>
#include <GuiRichEdit.au3>
#include <WindowsStylesConstants.au3>

Global $g_hRichEdit, $g_idMnu, $g_idMni_Undo, $g_idMni_Redo, $g_idMni_Cut, $g_idMni_Copy
Global $g_idMni_Paste, $g_idMni_PasteSpl

Example()

Func Example()
	Local $hGui, $idMni_PasteSplRTF, $idMni_PasteSplwObjs
	$hGui = GUICreate("Beispiel (" & StringTrimRight(@ScriptName, 4) & ")", 320, 350, -1, -1)
	$g_hRichEdit = _GUICtrlRichEdit_Create($hGui, "Dies ist ein Test.", 10, 10, 300, 220, _
			BitOR($ES_MULTILINE, $WS_VSCROLL, $ES_AUTOVSCROLL))
	GUISetState(@SW_SHOW)

	_GUICtrlRichEdit_AppendText($g_hRichEdit, ReadBmpToRtf(FindFirstBMP()) & @CR)

	GUIRegisterMsg($WM_NOTIFY, "WM_NOTIFY")

	$g_idMnu = GUICtrlCreateContextMenu(GUICtrlCreateDummy())
	$g_idMni_Undo = GUICtrlCreateMenuItem("Rückgängig", $g_idMnu)
	$g_idMni_Redo = GUICtrlCreateMenuItem("Wiederherstellen", $g_idMnu)
	GUICtrlCreateMenuItem("", $g_idMnu)
	$g_idMni_Cut = GUICtrlCreateMenuItem("Ausschneiden", $g_idMnu)
	$g_idMni_Copy = GUICtrlCreateMenuItem("Kopieren", $g_idMnu)
	$g_idMni_Paste = GUICtrlCreateMenuItem("Einfügen", $g_idMnu)
	$g_idMni_PasteSpl = GUICtrlCreateMenu("Einfügen Spezial", $g_idMnu)
	$idMni_PasteSplRTF = GUICtrlCreateMenuItem("Nur RTF ", $g_idMni_PasteSpl)
	$idMni_PasteSplwObjs = GUICtrlCreateMenuItem("Mit Objekten", $g_idMni_PasteSpl)
	_GUICtrlRichEdit_SetEventMask($g_hRichEdit, $ENM_MOUSEEVENTS)

	While True
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				_GUICtrlRichEdit_Destroy($g_hRichEdit) ; wird benötigt, da sonst das Skript abstürzt
;~ 				GUIDelete() 	; ist auch in Ordnung
				Exit
			Case $g_idMni_Undo
				_GUICtrlRichEdit_Undo($g_hRichEdit)
			Case $g_idMni_Redo
				_GUICtrlRichEdit_Redo($g_hRichEdit)
			Case $g_idMni_Cut
				_GUICtrlRichEdit_Cut($g_hRichEdit)
			Case $g_idMni_Copy
				_GUICtrlRichEdit_Copy($g_hRichEdit)
			Case $g_idMni_Paste
				_GUICtrlRichEdit_Paste($g_hRichEdit)
			Case $idMni_PasteSplRTF
				_GUICtrlRichEdit_PasteSpecial($g_hRichEdit, False)
			Case $idMni_PasteSplwObjs
				_GUICtrlRichEdit_PasteSpecial($g_hRichEdit, True)
		EndSwitch
	WEnd
EndFunc   ;==>Example

Func WM_NOTIFY($hWnd, $iMsg, $wParam, $lParam)
	#forceref $iMsg, $wParam
	Local $hWndFrom, $iCode, $tNMHDR, $tMsgFilter, $hMenu
	$tNMHDR = DllStructCreate($tagNMHDR, $lParam)
	$hWndFrom = HWnd(DllStructGetData($tNMHDR, "hWndFrom"))
	$iCode = DllStructGetData($tNMHDR, "Code")
	Switch $hWndFrom
		Case $g_hRichEdit
			Select
				Case $iCode = $EN_MSGFILTER
					$tMsgFilter = DllStructCreate($tagMSGFILTER, $lParam)
					If DllStructGetData($tMsgFilter, "msg") = $WM_RBUTTONUP Then
						$hMenu = GUICtrlGetHandle($g_idMnu)
						SetMenuTexts($hWndFrom, $hMenu)
						_GUICtrlMenu_TrackPopupMenu($hMenu, $hWnd)
					EndIf
			EndSelect
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>WM_NOTIFY

Func SetMenuTexts($hWnd, $hMenu)
	Local $fState
	If _GUICtrlRichEdit_CanUndo($hWnd) Then
		_GUICtrlMenu_SetItemEnabled($hMenu, $g_idMni_Undo, True, False)
		_GUICtrlMenu_SetItemText($hMenu, $g_idMni_Undo, "Rückgängig: " & _GUICtrlRichEdit_GetNextUndo($hWnd), False)
	Else
		_GUICtrlMenu_SetItemText($hMenu, $g_idMni_Undo, "Rückgängig", False)
		_GUICtrlMenu_SetItemEnabled($hMenu, $g_idMni_Undo, False, False)
	EndIf
	If _GUICtrlRichEdit_CanRedo($hWnd) Then
		_GUICtrlMenu_SetItemEnabled($hMenu, $g_idMni_Redo, True, False)
		_GUICtrlMenu_SetItemText($hMenu, $g_idMni_Redo, "Wiederherstellen: " & _GUICtrlRichEdit_GetNextRedo($hWnd), False)
	Else
		_GUICtrlMenu_SetItemText($hMenu, $g_idMni_Redo, "Wiederherstellen", False)
		_GUICtrlMenu_SetItemEnabled($hMenu, $g_idMni_Redo, False, False)
	EndIf
	$fState = _GUICtrlRichEdit_IsTextSelected($hWnd)
	_GUICtrlMenu_SetItemEnabled($hMenu, $g_idMni_Cut, $fState, False)
	_GUICtrlMenu_SetItemEnabled($hMenu, $g_idMni_Copy, $fState, False)

	_GUICtrlMenu_SetItemEnabled($hMenu, $g_idMni_Paste, _GUICtrlRichEdit_CanPaste($hWnd), False)

	_GUICtrlMenu_SetItemEnabled($hMenu, $g_idMni_PasteSpl, _GUICtrlRichEdit_CanPasteSpecial($hWnd), False)
EndFunc   ;==>SetMenuTexts

Func ReadBmpToRtf($sBmpFilspc)
	Local $hFile, $sRtf
	$hFile = FileOpen($sBmpFilspc, 16)
	If FileRead($hFile, 2) <> "0x424D" Then Return SetError(1, 0, "")
	FileRead($hFile, 12)
	$sRtf = '{\rtf1{\pict\dibitmap ' & Hex(FileRead($hFile)) & '}}'
	FileClose($hFile)
	Return $sRtf
EndFunc   ;==>ReadBmpToRtf

Func FindFirstBMP($sPath = @WindowsDir)
	Local $hFind, $sBmpFilspc
	$hFind = FileFindFirstFile($sPath & "\*.bmp")
	$sBmpFilspc = FileFindNextFile($hFind)
	FileClose($hFind)
	Return $sPath & "\" & $sBmpFilspc
EndFunc   ;==>FindFirstBMP
