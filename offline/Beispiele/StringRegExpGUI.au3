#include <AutoItConstants.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <FileConstants.au3>
#include <GuiConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <StaticConstants.au3>
#include <StringConstants.au3>
#include <WindowsConstants.au3>

; =======================================================================
; Originalidee von w0uter, modifiziert von steve8tch, jpm
; 2008 geupdated um mit der neuen PCRE Implementation zu funktionieren
; 	Entfernt: 		Messageboxen und Splashscreens
;	Hinzugefügt:	Statusbar für Anzeigen
;					Timer
; 2011 geupdated
;	Geändert:		Hilfebutton funktioniert jetzt auch in kompilierten Skripten
;					64Bit Handling
;					Anderer Seperator in GUICtrlSetData wird benutzt (Idee von FichteFoll)
;					Anzeige gefixt, wenn die Ergebnisnummer aus der Ziffer 9 besteht (Dank an FichteFoll)
; 2020 geupdated (von jpm)
;	Drag&Drop anstelle von Browsing hinzugefügt
;			eine solche Datei, deren erste Zeile ein Muster ist, z. B.: /pattern/
;	behoben: Gleiches Muster nur einmal hinzufügen/entfernen
; =======================================================================


Global Const $g_sSep = Chr(11) ; --> 0x0B = VT - Neuer Seperator, da der Standard "|" oft in Pattern verwendet wird!
Opt("GUIDataSeparatorChar", $g_sSep)
Global $g_sInitialDir = @ScriptDir
Global Const $GREEN = 0xAAFFD5
Global Const $GREY = 0xD4D0C8
Global Const $RED = 0xFF8888
Global Const $BLACK = 0x000000
Global Const $BLUE = 0x0000FF
Global Const $SOFTYELLOW = 0xFBFFC6
Global Const $YELLOW = 0xFFFC8A
Global $g_idStringToTest ; Enthält den aktuell ausgewählten Tab für den Inputstring, welcher getestet werden soll (z.B. von der Editbox oder der Textdatei)
; StringRegExp() gibt die Ergebnisse in 3 Formen wieder: String (rtn flag 0), Array (rtn flag 1,2,3) oder Array aus Arrays (rtn flag 4)
Global $g_bResultTrueFalseExpected = False
Global $g_bArrayOfArraysExpected = False
GUICreate("StringRegExp Originalidee -von w0uter, geändert Steve8tch, Jpm", 550, 596, (@DesktopWidth - 550) / 2, (@DesktopHeight - 570) / 2, -1, $WS_EX_ACCEPTFILES)
GUICtrlCreateGroup("Pattern   -  $ptn", 10, 210, 530, 60)
GUICtrlCreateGroup("Output", 140, 280, 400, 280)
GUICtrlCreateGroup("       Return Flag", 10, 280, 120, 120)
GUICtrlCreateGroup("           Start", 10, 410, 120, 50)
GUICtrlCreateGroup("@error     @extended", 10, 470, 120, 50)
Global $g_idRadio_0 = GUICtrlCreateRadio("0", 60, 300, 50, 18)
Global $g_idRadio_1 = GUICtrlCreateRadio("1", 60, 318, 50, 18)
Global $g_idRadio_2 = GUICtrlCreateRadio("2", 60, 336, 50, 18)
Global $g_idRadio_3 = GUICtrlCreateRadio("3", 60, 354, 50, 18)
Global $g_idRadio_4 = GUICtrlCreateRadio("4", 60, 372, 50, 18)
GUICtrlSetState($g_idRadio_1, $GUI_CHECKED)

Local $idTab = GUICtrlCreateTab(10, 10, 530, 190)
Global $idTabitem1 = GUICtrlCreateTabItem("C'n'P des zu prüfenden Textes - $str")
Local $idInputEditBox = GUICtrlCreateEdit("", 20, 40, 510, 150, BitOR($ES_WANTRETURN, $WS_VSCROLL, $WS_HSCROLL, $ES_AUTOVSCROLL, $ES_AUTOHSCROLL))
GUICtrlSetState(-1, $GUI_DROPACCEPTED)
GUICtrlSetBkColor($idInputEditBox, $SOFTYELLOW)
Global $idTabitem2 = GUICtrlCreateTabItem("Text aus Datei laden")
Local $idBrowse = GUICtrlCreateButton("Durchsuchen...", 20, 40, 100, 20)
Global $g_idPathToInputFile = GUICtrlCreateEdit("", 130, 40, 400, 20, BitOR($ES_WANTRETURN, $WS_HSCROLL, $ES_AUTOHSCROLL))
GUICtrlSetState(-1, $GUI_DROPACCEPTED)
Global $g_idInputFromFile = GUICtrlCreateEdit("", 20, 70, 510, 120, BitOR($ES_WANTRETURN, $WS_VSCROLL, $WS_HSCROLL, $ES_AUTOVSCROLL, $ES_AUTOHSCROLL))
GUICtrlSetState(-1, $GUI_DROPACCEPTED)
GUICtrlSetBkColor($g_idInputFromFile, $SOFTYELLOW)
GUICtrlCreateTabItem("") ;
Global $g_idOut = GUICtrlCreateEdit("", 150, 296, 380, 262, BitOR($ES_WANTRETURN, $WS_VSCROLL, $WS_HSCROLL, $ES_AUTOVSCROLL, $ES_AUTOHSCROLL))
GUICtrlSetBkColor($g_idOut, $SOFTYELLOW)
Global $g_idPattern = GUICtrlCreateCombo("", 70, 230, 430, 30)
GUICtrlSetFont($g_idPattern, 14, -1, -1, "Arial")
GUICtrlSetColor($g_idPattern, $BLUE)
GUICtrlSetBkColor($g_idPattern, $YELLOW)
Global $g_sPatterns = readDatFile()
GUICtrlSetData($g_idPattern, $g_sPatterns, "(.*)")
Global $idDoPtnAdd = GUICtrlCreateButton("+", 504, 225, 30, 18)
Global $idDoPtnDel = GUICtrlCreateButton("-", 504, 245, 30, 18)
Global $idTest = GUICtrlCreateButton("Test", 20, 235, 40, 20, $BS_DEFPUSHBUTTON)
Global $g_idOffset = GUICtrlCreateInput("1", 40, 430, 60, 20)
Global $g_idErr = GUICtrlCreateInput("", 20, 490, 40, 20, $ES_READONLY)
Global $g_idExt = GUICtrlCreateInput("", 70, 490, 50, 20, $ES_READONLY)
Global $id_Help = GUICtrlCreateButton("StringRegExp HILFE", 10, 530, 120, 30)
; Global $hGui_Exit = GUICtrlCreateButton("EXIT", 10, 530, 55, 30)
Global $g_idTimerDisplay = GUICtrlCreateLabel("Zeit (ms)", 3, 573, 142, 20, $SS_SUNKEN)
Global $g_idStatusBar = GUICtrlCreateLabel("Status..", 150, 573, 395, 20, $SS_SUNKEN)
$g_idStringToTest = $idInputEditBox ; default - Lesen des Strings aus der Editbox

Global $g_sTestFile = chkTestFile()
If $g_sTestFile Then doBrowseForFile($g_sTestFile)

; ToolTips:
; (GUICtrlSetTip braucht IE version 5+)
If Number(StringLeft(RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer", "Version"), 1)) > 4 Then
	GUICtrlSetTip($g_idRadio_0, "Gibt 1 = Treffer oder 0 = kein Treffer zurück.", "Return Flag= 0", $TIP_INFOICON, $TIP_BALLOON)
	GUICtrlSetTip($g_idRadio_1, "Gibt einen Array der Treffer zurück.", "Return Flag = 1", $TIP_INFOICON, $TIP_BALLOON)
	GUICtrlSetTip($g_idRadio_2, "Gibt den vollen Treffer UND einen Array mit Treffern zurück (Perl/PHP Stil).", "Return Flag = 2", $TIP_INFOICON, $TIP_BALLOON)
	GUICtrlSetTip($g_idRadio_3, "Gibt einen Array mit globalen Treffern zurück.", "Return Flag = 3", $TIP_INFOICON, $TIP_BALLOON)
	GUICtrlSetTip($g_idRadio_4, "Gibt einen Array mit vollen UND globalen Treffern zurück. (Perl / PHP Stil).", "Return Flag = 4", $TIP_INFOICON, $TIP_BALLOON)
	GUICtrlSetTip($g_idOffset, "[Optional] Die Anfangsposition (Default = 1).", "Startposition", $TIP_INFOICON, $TIP_BALLOON)
Else
	GUICtrlSetTip($g_idRadio_0, "Gibt 1 = Treffer oder 0 = kein Treffer zurück.")
	GUICtrlSetTip($g_idRadio_1, "Gibt einen Array der Treffer zurück.")
	GUICtrlSetTip($g_idRadio_2, "Gibt den vollen Treffer UND einen Array mit Treffern zurück (Perl/PHP Stil).")
	GUICtrlSetTip($g_idRadio_3, "Gibt einen Array mit globalen Treffern zurück.")
	GUICtrlSetTip($g_idRadio_4, "Gibt einen Array mit vollen UND globalen Treffern zurück. (Perl / PHP Stil).")
	GUICtrlSetTip($g_idOffset, "[Optional] Die Anfangsposition (Default = 1).", "Startposition")
EndIf

GUISetState(@SW_SHOW)
While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			Exit
		Case $GUI_EVENT_DROPPED
			If (@GUI_DropId = $g_idPathToInputFile) Or (@GUI_DropId = $g_idInputFromFile) Or (@GUI_DropId = $idInputEditBox) Then
				doBrowseForFile(@GUI_DragFile)
				FileCopy(@GUI_DragFile, @AppDataDir & "\StringRegExpGUITest.dat", 1)
			EndIf
		Case $idBrowse
			doBrowseForFile("")
		Case $idTest
			doStringRegExpTest()
		Case $idTab
			If GUICtrlRead($idTab) = 0 Then
				$g_idStringToTest = $idInputEditBox
			Else
				$g_idStringToTest = $g_idInputFromFile
			EndIf
		Case $idDoPtnAdd
			doPtnAdd(GUICtrlRead($g_idPattern))
		Case $idDoPtnDel
			doPtnDel(GUICtrlRead($g_idPattern))
		Case $id_Help
			doDisplayHelp()
		Case Else
			;;
	EndSwitch
WEnd

Func doStringRegExpTest()
	Local $aA, $aB ; Arrays
	Local $i, $j ; For-Vars für Arraydurchlauf
	Local $c ; Counter
	Local $hTimer, $t ; Timer
	Local $iErr, $iExt ; @error / @extended
	Local $sResult = "" ; Ergebnis
	Local $iStrLgth ; Stringlänge der Nummer der Ergebnisse.
	Local $x, $y
	GUICtrlSetData($g_idOut, "")
	GUICtrlSetData($g_idStatusBar, "Bitte warten...")
	GUICtrlSetBkColor($g_idStatusBar, $GREEN)
	$hTimer = TimerInit()
	$aA = StringRegExp(GUICtrlRead($g_idStringToTest), GUICtrlRead($g_idPattern), getReturnFlag(), getOffset())
	$iErr = @error
	$iExt = @extended
	$t = TimerDiff($hTimer)
	GUICtrlSetData($g_idTimerDisplay, $t & "  ms")
	GUICtrlSetData($g_idErr, $iErr)
	GUICtrlSetData($g_idExt, $iExt)
	Select
		Case $iErr = 0
			GUICtrlSetData($g_idStatusBar, "Gültiges Pattern. Aktualisieren...")
			GUICtrlSetBkColor($g_idStatusBar, $GREEN)
		Case $iErr = 1
			GUICtrlSetData($g_idStatusBar, "Array ist ungültig, keine Treffer!")
			GUICtrlSetBkColor($g_idStatusBar, $RED)
		Case $iErr = 2
			GUICtrlSetData($g_idStatusBar, "Schechtes Pattern! Array ungültig! Platznummer des Errors in @extended!")
			GUICtrlSetBkColor($g_idStatusBar, $RED)
	EndSelect
	If $iErr = 0 Then
		$x = UBound($aA)
		If $g_bArrayOfArraysExpected Then
			$y = UBound($aA[0])
			$x *= $y
		EndIf
		$iStrLgth = StringLen(String($x - 1))
		If $g_bArrayOfArraysExpected Then ; Ergebnisse -> Array erwartet
			$c = 0
			If UBound($aA) Then
				For $i = 0 To UBound($aA) - 1
					$aB = $aA[$i]
					For $j = 0 To UBound($aB) - 1
						$sResult &= StringFormat("%0" & $iStrLgth & "i", $c) & ' => ' & $aB[$j] & @CRLF
						$c += 1
					Next
					$sResult &= @CRLF
				Next
				GUICtrlSetData($g_idOut, $sResult)
				GUICtrlSetData($g_idStatusBar, "Fertig!")
			EndIf
		ElseIf $g_bResultTrueFalseExpected Then ; Ergebnis -> String
			If $aA = 1 Then
				$sResult &= "1   <-- ERFOLG, Treffer gefunden!" & @CRLF
			Else
				$sResult &= "0   <-- FEHLSCHLAG, keine Treffer gefunden!" & @CRLF
			EndIf
			GUICtrlSetData($g_idOut, $sResult)
			GUICtrlSetData($g_idStatusBar, "Fertig!")
		Else ; Einzel-Array
			If UBound($aA) Then
				For $i = 0 To UBound($aA) - 1
					$sResult &= StringFormat("%0" & $iStrLgth & "i", $i) & ' => ' & $aA[$i] & @CRLF
				Next
				GUICtrlSetData($g_idOut, $sResult)
				GUICtrlSetData($g_idStatusBar, "Fertig!")
			EndIf
		EndIf
	EndIf
EndFunc   ;==>doStringRegExpTest

Func getReturnFlag()
	$g_bArrayOfArraysExpected = False
	$g_bResultTrueFalseExpected = False
	Switch $GUI_CHECKED
		Case GUICtrlRead($g_idRadio_0)
			$g_bResultTrueFalseExpected = True
			Return $STR_REGEXPMATCH
		Case GUICtrlRead($g_idRadio_1)
			Return $STR_REGEXPARRAYMATCH
		Case GUICtrlRead($g_idRadio_2)
			Return $STR_REGEXPARRAYFULLMATCH
		Case GUICtrlRead($g_idRadio_3)
			Return $STR_REGEXPARRAYGLOBALMATCH
		Case GUICtrlRead($g_idRadio_4)
			$g_bArrayOfArraysExpected = True
			Return $STR_REGEXPARRAYGLOBALFULLMATCH
	EndSwitch
EndFunc   ;==>getReturnFlag

Func getOffset()
	Local $x
	$x = Int(GUICtrlRead($g_idOffset))
	If @error Then
		Return 1
	Else
		Return $x
	EndIf
EndFunc   ;==>getOffset

Func doBrowseForFile($sFilePath)
	Local $bOpendialog = $sFilePath = ""
	If $sFilePath = "" Then
		$sFilePath = FileOpenDialog("Öffnen...", $g_sInitialDir, "Text (*.*)", $FD_FILEMUSTEXIST)
		$g_sInitialDir = StringTrimRight($sFilePath, StringInStr($sFilePath, "\", "-1"))
		GUICtrlSetData($g_idPathToInputFile, $sFilePath)
	EndIf
	Local $sFileTxt = FileRead($sFilePath)
	GUICtrlSetData($g_idStatusBar, "Lade..")
	GUICtrlSetBkColor($g_idStatusBar, $GREEN)
	If Not $bOpendialog Then
		Local $sFileFirstLine = FileReadLine($sFilePath)
		If (StringLeft($sFileFirstLine, 1) = "/") And (StringRight($sFileFirstLine, 1) = "/") Then
			Local $x = StringTrimLeft($sFileFirstLine, 1)
			$x = StringTrimRight($sFileFirstLine, 1)
			doPtnAdd($x)
			$sFileTxt = FileRead($sFilePath)
			$sFileTxt = StringReplace($sFileTxt, $sFileFirstLine & @CRLF, "", 1) ; strip out first line
		EndIf
	EndIf

	GUICtrlSetData($g_idStatusBar, "Aktualisiere...")

	GUICtrlSetData($g_idStringToTest, $sFileTxt)
	GUICtrlSetData($g_idStatusBar, "")
	GUICtrlSetBkColor($g_idStatusBar, $GREY)
EndFunc   ;==>doBrowseForFile

Func readDatFile()
	Local $sDat, $sOut = ""
	Local $sHeader = "[Diese Datei nicht löschen, Pattern unten gelistet]" & @CRLF
	Local $sDatFile = @AppDataDir & "\StringRegExpGUIPattern.dat"
	If FileExists($sDatFile) = 0 Then
		$sDat = $sHeader & "(.*)" & @CRLF
		FileWrite($sDatFile, $sDat)
		$sOut = "(.*)"
	Else
		$sDat = FileRead($sDatFile)
		$sDat = StringReplace($sDat, $sHeader, "", 1)         ; Header löschen
		; @CRLF löschen
		If StringLeft($sDat, 2) = @CRLF Then $sDat = StringTrimLeft($sDat, 2)
		If StringRight($sDat, 2) = @CRLF Then $sDat = StringTrimRight($sDat, 2)
		If $sDat <> "" Then ; Es muss >= 1 Pattern existieren!
			$sDat = StringTrimRight($sDat, 2)
			$sOut = StringReplace($sDat, @CRLF, $g_sSep)
		Else
			FileWrite($sDatFile, $sHeader & "(.*)" & @CRLF)
			$sOut = "(.*)"
		EndIf
	EndIf
	Return $sOut
EndFunc   ;==>readDatFile

Func chkTestFile()
	Local $sTestFile = @AppDataDir & "\StringRegExpGUITest.dat"
	If Not FileExists($sTestFile) Then
		$sTestFile = ""
	EndIf
	Return $sTestFile
EndFunc   ;==>chkTestFile

Func doPtnDel($x)
	Local $sDat
	Local $sDatFile = @AppDataDir & "\StringRegExpGUIPattern.dat"
	$sDat = FileRead($sDatFile)
	If $x = "(.*)" Then Return
	;sucht und entfernt nun diesen Eintrag aus der dat-Datei
	$sDat = StringReplace($sDat, $x & @CRLF, "", 1)
	;Wenn $x in der Mitte der dat-Datei stand, werden nun alle doppelten @CRLF-Einträge gefunden und entfernt
	$sDat = StringReplace($sDat, @CRLF & @CRLF, @CRLF)
	;Löscht nun die vorherige dat-Datei und erstellt eine neue Datei
	If FileDelete($sDatFile) Then
		FileWrite($sDatFile, $sDat)
	Else
		MsgBox($MB_SYSTEMMODAL, "***ERROR**", "Löschen eines Eintrags fehlgeschlagen!" & @CRLF & _
				"Alte Datei konnte nicht gelöscht werden!")
	EndIf
	;Jetzt neue dat-Datei einlesen
	$g_sPatterns = readDatFile()
	GUICtrlSetData($g_idPattern, $g_sSep & $g_sPatterns, "(.*)")
	GUICtrlSetData($g_idStringToTest, "")
	; Unterdrückung der vorherigen Testdatei, falls vorhanden
	FileDelete($g_sTestFile)
EndFunc   ;==>doPtnDel

Func doPtnAdd($x)
	Local $sDat
	Local $sDatFile = @AppDataDir & "\StringRegExpGUIPattern.dat"
	$sDat = FileRead($sDatFile)
	; prüfen, ob das Muster bereits existiert
	If Not (StringInStr($sDat, @CRLF & $x & @CRLF) Or ($x = "(.*)")) Then
		;Fügt nun diesen Eintrag am Ende der dat-Datei hinzu
		$sDat &= @CRLF & $x & @CRLF
		;Wenn $x in der Mitte der dat-Datei stand, werden nun alle doppelten @CRLF-Einträge gefunden und entfernt
		$sDat = StringReplace($sDat, @CRLF & @CRLF, @CRLF)
		;Löscht nun die vorherige dat-Datei und erstellt eine neue Datei
		If FileDelete($sDatFile) Then
			FileWrite($sDatFile, $sDat)
		Else
			MsgBox($MB_SYSTEMMODAL, "***ERROR**", "Löschen eines Eintrags fehlgeschlagen!" & @CRLF & _
					"Alte Datei konnte nicht gelöscht werden!")
		EndIf
	EndIf
	; Neue Datei einlesen.
	$g_sPatterns = readDatFile()
	GUICtrlSetData($g_idPattern, $g_sSep & $g_sPatterns, $x)
EndFunc   ;==>doPtnAdd

Func doDisplayHelp()
	Local $iErr = 0
	If @Compiled = 0 Then
		Local $sPathToHelpFile = StringLeft(@AutoItExe, StringInStr(@AutoItExe, "\", $STR_NOCASESENSEBASIC, -1))
		Run($sPathToHelpFile & "AutoIt3Help.exe StringRegExp")
		$iErr = @error
	Else
		; X64 Support
		Local $sWow64 = ""
		If @AutoItX64 Then $sWow64 = "\Wow6432Node"

		;ermittelt den Installationsordner von AutoIt
		Local $sPathToAutoIt = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE" & $sWow64 & "\AutoIt v3\AutoIt", "InstallDir")
		$iErr = @error

		If $iErr = 0 Then
			Run($sPathToAutoIt & "\AutoIt3Help.exe StringRegExp")
			$iErr = @error
		EndIf
	EndIf
	If $iErr = 1 Then MsgBox($MB_SYSTEMMODAL, "Fehler", "Hilfedatei unauffindbar!")
EndFunc   ;==>doDisplayHelp
