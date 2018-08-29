#region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_AU3Check_Parameters=-d -w 1 -w 2 -w 3 -w 4 -w 5 -w 6
#endregion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <FTPEx.au3>
#include <File.au3>
#include <Array.au3>

Opt('MustDeclareVars', 1)

_example2()

Func _example2()
	;lädt alle Dateien eines Ordner mithilfe  _FTP_FilePut auf den FTP-Server (noch ohne Unterordner)
	Local $s_ServerName = 'guest.autobert.myplace.net' ;dieser Server existiert nicht
	Local $s_Username = "guest"
	Local $s_Password = "TopSecret"

	Local $s_LocalFolder = @ScriptDir ;das angegebene Verzsichnis muss existieren
	Local $s_RemoteFolder = "/FTPTestfiles/Test/" ;dieser Ordner wird notfalls angelegt
	Local $i_Passive = 0 ;manche Server benötigen hier eine 1 für Passiven Modus
	Local $l_InternetSession, $l_FTPSession, $errOpen, $errFTP

	$l_InternetSession = _FTP_Open('AuoItZilla') ;Öffnet eine FTP Sitzung
	$errOpen = @error
	If Not @error Then
		$l_FTPSession = _FTP_Connect($l_InternetSession, $s_ServerName, $s_Username, $s_Password, $i_Passive) ;Verbindet zu einem FTP Server
		$errFTP = @error
		If Not @error Then
			_FolderPut($l_FTPSession, $s_LocalFolder, $s_RemoteFolder, "_FTP*3.au3") ;kopiert alle au3 Dateien
			If Not @error Then
				ConsoleWrite("_FolderPut: " & @extended & " Dateien erfolgreich übertragen" & @CRLF)
			Else
				ConsoleWrite("_FolderPut Fehler:" & @error & " " & @extended & @CRLF)
			EndIf
		Else
			MsgBox(0, "Connect", "fehlgeschlagen")
			ConsoleWrite("Connect: " & " " & $errFTP & @CRLF)
		EndIf
	Else
		MsgBox(0, "Open", "fehlgeschlagen")
		ConsoleWrite("Open " & " " & $errOpen & @CRLF)
	EndIf
	_FTP_Close($l_InternetSession) ;schliesst die Sitzung
EndFunc   ;==>_example2

Func _FolderPut($l_FTPSession, $s_LocalFolder, $s_RemoteFolder, $sFilter = "*")
	Local $bDebugFP = True ;um Debuginfos an- auszuschalten
	If $bDebugFP Then ConsoleWrite("Lokal " & $s_LocalFolder & " Remote " & $s_RemoteFolder & @CRLF)
	If StringRight($s_RemoteFolder, 1) <> "/" Then $s_RemoteFolder &= "/"
	If StringLeft($s_RemoteFolder, 1) <> "/" Then $s_RemoteFolder = "/" & $s_RemoteFolder
	Local $aPathSplit = StringSplit($s_RemoteFolder, "/")
	_ArrayDisplay($aPathSplit)
	For $i = 2 To $aPathSplit[0] - 1 ;Element 1 ist leer ebenso letztes durch StringTrim.....
		If $bDebugFP Then ConsoleWrite($aPathSplit[$i])
		_FTP_DirSetCurrent($l_FTPSession, $aPathSplit[$i])
		If @error Then
			If $bDebugFP Then ConsoleWrite(@TAB & "wird versucht anzulegen" & @TAB)
			_FTP_DirCreate($l_FTPSession, $aPathSplit[$i])
			_FTP_DirSetCurrent($l_FTPSession, $aPathSplit[$i])
			If @error Then
				If $bDebugFP Then ConsoleWrite("Fehler " & @error & @CRLF)
				SetError(1, $i)
				Return 0
			Else
				If $bDebugFP Then ConsoleWrite("OK" & @CRLF)
			EndIf
		Else
			If $bDebugFP Then ConsoleWrite("/")
		EndIf
	Next
	If $bDebugFP Then ConsoleWrite(@CRLF & "Aktuelles Verzeichnis" & _FTP_DirGetCurrent($l_FTPSession) & @CRLF)
	Local $aUpload_Files = _FileListToArray($s_LocalFolder, $sFilter, 1)
	Local $iErrors = 0
	Local $iSuccess = 0
	For $i = 1 To $aUpload_Files[0]
		If $bDebugFP Then ConsoleWrite($aUpload_Files[$i] & @TAB)
		If _FTP_FilePut($l_FTPSession, $aUpload_Files[$i], $aUpload_Files[$i]) Then
			$iSuccess += 1
			If $bDebugFP Then ConsoleWrite("OK" & @CRLF)
		Else
			$iErrors += 1
			If $bDebugFP Then ConsoleWrite("Fehler: " & @error & @CRLF)
		EndIf
	Next
	If $iErrors > 0 Then
		SetError(2, $iErrors, 0)
	Else
		SetExtended($iSuccess)
	EndIf
EndFunc   ;==>_FolderPut