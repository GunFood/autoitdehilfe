#include <MsgBoxConstants.au3>

Example()

Func Example()
	; Create a temporary dir
	Local $sDirPath = @TempDir & "\TempDir"
	DirRemove($sDirPath)
	DirCreate($sDirPath)

	; Create a NTFS link to the document dir
	Local $sNTFSLink = $sDirPath & "\ExampleNTFSLinkToFolder"
	Local $iNTFSLink = FileCreateNTFSLink(@MyDocumentsDir, $sNTFSLink)

	; Display an explorer of whether the NTFS link was created.
	Local $hWin = 0
	If $iNTFSLink Then
		ShellExecute($sDirPath)
		$hWin = WinWaitActive("[CLASS:CabinetWClass]", "") ; Wait explorer window active
	Else
		MsgBox($MB_SYSTEMMODAL, "", "The NTFS link wasn't created." & @CRLF & "FileCreateNTFSLink returned: " & $iNTFSLink)
	EndIf

	If IsNTFSLink($sNTFSLink) Then
		MsgBox($MB_SYSTEMMODAL, "", "The dirpath is a NTFSLink to a folder." & @CRLF & @CRLF & _
				"You can click on it.")
	Else
		MsgBox($MB_SYSTEMMODAL, "", "The dirpath is not a NTFSLink to a folder.")
	EndIf

	; Delete the temporary dirs.
	DirRemove($sNTFSLink)
	DirRemove($sDirPath)

	; close explorer windows
	If $hWin Then WinKill($hWin, "")

EndFunc   ;==>Example

; Check if the dirpath is a NTFSLink to a folder..
Func IsNTFSLink($sDirPath)
	Return StringInStr(FileGetAttrib($sDirPath), "J") > 0
EndFunc   ;==>IsNTFSLink
