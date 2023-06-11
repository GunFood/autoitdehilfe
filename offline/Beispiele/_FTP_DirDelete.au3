#region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Au3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#endregion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <FTPEx.au3>
#include <File.au3>
#include <Array.au3>

Opt('MustDeclareVars', 1)

_example1()

Func _example1()
	Local $s_ServerName = 'ftp.nowhere.de' ;dieser Server existiert nicht
	Local $s_Username = "autobert"
	Local $s_Password = "topSecret"


	Local $s_RemoteFolder = "/FTPTestfiles/" ;dieser Ordner wird gelöscht
	Local $i_Passive = 1
	Local $l_InternetSession, $l_FTPSession, $errOpen, $errFTP

	$l_InternetSession = _FTP_Open('AuoItZilla') ;Öffnet eine FTP Sitzung
	$errOpen = @error
	If Not @error Then
		$l_FTPSession = _FTP_Connect($l_InternetSession, $s_ServerName, $s_Username, $s_Password, $i_Passive) ;Verbindet zu einem FTP Server
		$errFTP = @error
		If Not @error Then
			If _FTP_DirDelete($l_FTPSession, $s_RemoteFolder) Then
				ConsoleWrite("Löschen von " & $s_RemoteFolder & " erfolgreich" & @CRLF)
			Else
				If _FTP_DirRemove($l_FTPSession, $s_RemoteFolder, True) Then
					ConsoleWrite("Löschen von " & $s_RemoteFolder & " erfolgreich" & @CRLF)
				Else
					ConsoleWrite("Löschen von " & $s_RemoteFolder & " fehlgeschlagen" & @CRLF)
				EndIf
			EndIf
		Else
			MsgBox(0, "Connect", "fehlgeschlagen")
			ConsoleWrite("Connect: " & " " & $errFTP & @CRLF)
		EndIf
	Else
		MsgBox(0, "Open", "fehlgeschlagen")
		ConsoleWrite("Open " & " " & $errOpen & @CRLF)
	EndIf
	_FTP_Close($l_InternetSession) ;schliesst die FTP-Sitzng
EndFunc   ;==>_example1

;===============================================================================
; Function Name:    _FTP_DirRemove($l_FTPSession, $sDir, $bDebug, $idProgress, $idLblPercent, $idLblFile)
; Description::        Löscht den amgegebenen Ordner inkl. aller Unterverzeichnisse
; Parameter(s):       $l_FTPSession    das von _FTP_Connect zurückgegebene Handle
;                    $sDir              Verzeichnispfad, der gelöscht werden soll
;                    $bDebug            optional     True protokolliert in der Konsole
;                    $idProgress        "            ID des Fortschrittbalkens
;                    $idLblPercent    "            ID des Labels für Prozentanzeige
;                    $idLblFile        "            ID des Labels für aktuelle Aktion
; Demo                Ja
;
; Autor(s):            autoBert (www.autoit.de)
;
;                    zur freien Benutzung in eigenen Skripten und auch zur freien Weitergabe unter der Vorgabe,
;                    dass diese Funktionsbeschreibumg inkl. Autor nicht enfernt wird
;===============================================================================
Func _FTP_DirRemove($l_FTPSession, $sDir, $bDebug = False, $idProgress = 0, $idLblPercent = 0, $idLblFile = 0)
	If StringRight($sDir, 1) <> "/" Then $sDir &= "/"
	Local $aResult[1], $iPercent, $iRes = 1
	ToolTip('Zusammen stellen der Vereichnisliste, bitte warten ...') ;kann auskommentiert werden
	_FTP_FileList_Rekursiv($l_FTPSession, $aResult, $sDir, True)
	_ArrayInsert($aResult, 1, $sDir)
	$aResult[0] += 1
	If $bDebug Then _ArrayDisplay($aResult)
	For $i = $aResult[0] To 1 Step -1
		If $bDebug Then ConsoleWrite($aResult[$i] & @TAB)
		If $idLblFile > 0 Then GUICtrlSetData($idLblFile, $aResult[$i])
		If StringRight($aResult[$i], 1) = "/" Then
			If _FTP_DirDelete($l_FTPSession, $aResult[$i]) Then
				If $bDebug Then ConsoleWrite("Ordner gelöscbt")
			Else
				$iRes = 0
				If $bDebug Then ConsoleWrite("Ordner NICHT gelöscbt")
			EndIf
		Else
			If _FTP_FileDelete($l_FTPSession, $aResult[$i]) Then
				If $bDebug Then ConsoleWrite("Datei gelöscbt")
			Else
				If $bDebug Then ConsoleWrite("Datei NICHT gelöscbt")
			EndIf
		EndIf
		$iPercent = Round(100 - ($i / $aResult[0] * 100), 2)
		If $idLblPercent > 0 Then GUICtrlSetData($idLblPercent, $iPercent)
		If $idProgress > 0 Then GUICtrlSetData($idProgress, $iPercent)
		If $bDebug Then ConsoleWrite(@TAB & $iPercent & @CRLF)
	Next
	Return $iRes
EndFunc   ;==>_FTP_DirRemove
;===============================================================================
; Function Name:    _FTP_FileList_Rekursiv($l_FTPSession, $aResult, $sPath, $bFolders)
; Description::        füllt ein Array mit Dateien (und Verzeichnissen wenn $bFolders true) des FTP-Pfades inkl. aller Unterverzeichnisse
; Parameter(s):       $l_FTPSession    das von _FTP_Connect zurückgegebene Handle
;                     $aResult   = das Array in dem die Ergebnisse eingefügt werden
;                    $sPath     = Verzeichnispfad, der eingefügt werden soll
;                    $bFolders    = True = auch Verzeichnisse einfügen, False = nur Dateien, Default = nur Dateien
;
; Autor(s):            autoBert (www.autoit.de)
;
;                    zur freien Benutzung in eigenen Skripten und auch zur freien Weitergabe unter der Vorgabe,
;                    dass diese Funktionsbeschreibumg inkl. Autor nicht enfernt wird
;===============================================================================
Func _FTP_FileList_Rekursiv($l_FTPSession, ByRef $aResult, $sPath, $bFolders = False)
	Local $aFiles, $aFolders
	If $sPath <> "" Then
		_FTP_DirSetCurrent($l_FTPSession, $sPath)
		;if _FTP_DirGetCurrent($l_FTPSession) <> $sPath Then Exit
	EndIf
	$aFiles = _Ftp_ListToArray($l_FTPSession, 2)
	If IsArray($aFiles) Then
		;_ArrayDisplay($aFiles)
		If $aFiles[0] > 0 Then
			For $i = 1 To $aFiles[0]
				_ArrayAdd($aResult, $sPath & "/" & $aFiles[$i])
				;ConsoleWrite("File: " & $sPath & "/" & $aFiles[$i] & @CRLF)
			Next
		EndIf
	EndIf
	$aFolders = _Ftp_ListToArray($l_FTPSession, 1)
	;_ArrayDisplay($aFolders)
	If IsArray($aFolders) Then
		If $aFolders[0] > 0 Then
			For $i = 1 To $aFolders[0]
				If $aFolders[$i] <> '.' And $aFolders[$i] <> '..' Then
					;ConsoleWrite("Folder: " & $sPath & "/" & $aFolders[$i] & @CRLF)
					If $bFolders Then _ArrayAdd($aResult, $sPath & "/" & $aFolders[$i] & "/")
					_FTP_FileList_Rekursiv($l_FTPSession, $aResult, $sPath & "/" & $aFolders[$i], $bFolders)
				EndIf
			Next
		EndIf
	EndIf
	$aResult[0] = UBound($aResult) - 1
EndFunc   ;==>_FTP_FileList_Rekursiv