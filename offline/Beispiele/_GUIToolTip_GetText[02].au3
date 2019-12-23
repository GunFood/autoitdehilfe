#include <GUIConstantsEx.au3>
#include <GUIToolTip.au3>
#include <MsgBoxConstants.au3>

Global $g_iPID

; Es ist der Mauszeiger über eines der Zeichen in der Charmap-App zu bewegen und 'g' zu drücken, um eine QuickInfo zu erhalten.
; Ermittelt dessen Textinformationen.
HotKeySet('g', "_Read_Tip")

Example()

Func Example()
	; Startet das character map Programm
	$g_iPID = Run("charmap.exe")
	; Warten bis es zum aktiven Fenster wird
	WinWaitActive("Character Map", "", 10)
	While ProcessExists($g_iPID)
		Sleep(100)
	WEnd
EndFunc   ;==>Example

Func _Read_Tip()
	; Liste mit Tooltips
	Local $aTipList = WinList("[CLASS:tooltips_class32]")
	Local $aRet
	; Prüfen welcher zu der App gehört
	For $i = 1 To $aTipList[0][0]
		If WinGetProcess($aTipList[$i][1]) = $g_iPID Then
			; Prüfen welches aktiv ist
			$aRet = _GUIToolTip_GetCurrentTool($aTipList[$i][1])
			; Wenn einer aktiv ist, dann zeige ihn an
			If $aRet[8] <> "" Then MsgBox(0, "Sicherer Tipp", $aRet[8])
		EndIf
	Next
EndFunc   ;==>_Read_Tip
