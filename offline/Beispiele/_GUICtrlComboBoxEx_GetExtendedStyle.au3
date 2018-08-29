#include <GuiComboBoxEx.au3>
#include <GUIConstantsEx.au3>
#include <GuiImageList.au3>
#include <MsgBoxConstants.au3>

Example()

Func Example()
	Local $hGui, $hImage, $hCombo

	; Erstellt eine GUI
	$hGui = GUICreate("ComboBoxEx: Ermittelt den erweiterten Stil", 400, 300)
	$hCombo = _GUICtrlComboBoxEx_Create($hGui, "", 2, 2, 394, 100)

	; Setzt den erweiterten Stil
	_GUICtrlComboBoxEx_SetExtendedStyle($hCombo, $CBES_EX_CASESENSITIVE)
	GUISetState(@SW_SHOW)

	$hImage = _GUIImageList_Create(16, 16, 5, 3)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 110)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 131)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 165)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 168)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 137)
	_GUIImageList_AddIcon($hImage, @SystemDir & "\shell32.dll", 146)
	_GUIImageList_Add($hImage, _GUICtrlComboBoxEx_CreateSolidBitMap($hCombo, 0xFF0000, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlComboBoxEx_CreateSolidBitMap($hCombo, 0x00FF00, 16, 16))
	_GUIImageList_Add($hImage, _GUICtrlComboBoxEx_CreateSolidBitMap($hCombo, 0x0000FF, 16, 16))
	_GUICtrlComboBoxEx_SetImageList($hCombo, $hImage)

	For $x = 0 To 8
		_GUICtrlComboBoxEx_AddString($hCombo, StringFormat("%03d : Zufallstring", Random(1, 100, 1)), $x, $x)
	Next

	; Ermittelt den erweiterten Stil
	MsgBox($MB_SYSTEMMODAL, "Information", "Gefundene erweiterte Stile: " & _DisplayExtendStringList($hCombo))

	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example

Func _DisplayExtendStringList($hCombo)
	Local $sStyles = @CRLF & @CRLF & @TAB
	If (BitAND(_GUICtrlComboBoxEx_GetExtendedStyle($hCombo), $CBES_EX_CASESENSITIVE) = $CBES_EX_CASESENSITIVE) Then $sStyles &= "$CBES_EX_CASESENSITIVE" & @CRLF & @TAB
	If (BitAND(_GUICtrlComboBoxEx_GetExtendedStyle($hCombo), $CBES_EX_NOEDITIMAGE) = $CBES_EX_NOEDITIMAGE) Then $sStyles &= "$CBES_EX_NOEDITIMAGE" & @CRLF & @TAB
	If (BitAND(_GUICtrlComboBoxEx_GetExtendedStyle($hCombo), $CBES_EX_NOEDITIMAGEINDENT) = $CBES_EX_NOEDITIMAGEINDENT) Then $sStyles &= "$CBES_EX_NOEDITIMAGEINDENT" & @CRLF & @TAB
	If (BitAND(_GUICtrlComboBoxEx_GetExtendedStyle($hCombo), $CBES_EX_NOSIZELIMIT) = $CBES_EX_NOSIZELIMIT) Then $sStyles &= "$CBES_EX_NOSIZELIMIT" & @CRLF & @TAB
;~ 	If (BitAND(_GUICtrlComboBoxEx_GetExtendedStyle($hCombo), $CBES_EX_PATHWORDBREAKPROC) = $CBES_EX_PATHWORDBREAKPROC) Then $sStyles &= "$CBES_EX_PATHWORDBREAKPROC"
	Return $sStyles
EndFunc   ;==>_DisplayExtendStringList
