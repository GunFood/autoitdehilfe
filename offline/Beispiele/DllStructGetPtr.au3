#include <MsgBoxConstants.au3>
#include <StructureConstants.au3>

Example()

Func Example()
	; Weist einer lokalen Variable das Handle zum momentanen aktiven Fenster zu.
	Local $hWnd = WinGetHandle("") ; Äquivalent zu: "[active]".

	; Weist einer lokalen Variable das Rechteck des Fensters (Array) zu.
	Local $aWndPos = WinGetPos($hWnd)

	; Weist einer lokalen Variable die Struktur zu welche mit tagRECT definiert ist.
	Local $tRECT = DllStructCreate($tagRECT)
	Local $iError = 0

	; Wenn ein Fehler aufgetaucht ist, so wird dieser angezeigt und False zurückgegeben.
	If @error Then
		$iError = @error
		MsgBox(BitOR($MB_SYSTEMMODAL, $MB_ICONHAND), Default, "Error in DllStructCreate, Code: " & $iError)
		Return False
	EndIf

	; Ruft die GetWindowRect Funktion mittels DllCall auf.
	DllCall("user32.dll", "int", "GetWindowRect", _
			"hwnd", $hWnd, _
			"ptr", DllStructGetPtr($tRECT))

	; Wenn ein Fehler aufgetaucht ist, so wird dieser angezeigt und gebe False zurück.
	If @error Then
		$iError = @error
		MsgBox(BitOR($MB_SYSTEMMODAL, $MB_ICONHAND), Default, "Error in DllCall, Code: " & $iError)
		Return False
	EndIf

	; Hinweis: Der zweite Parameter der GetWindowRect Funktion benötigt einen Pointer.
	; Der Rückgabewert durch DllStructCreate ist KEIN Pointer. Wird jedoch 'struct*' verwendet, so kann eine Struktur als ein Pointer übergeben werden.

	; Weist lokalen Variablen die Werte des zurückgegebenen Rechtecks zurück.
	Local $iLeft = DllStructGetData($tRECT, "Left") ; Oder 1 statt "Left".
	Local $iTop = DllStructGetData($tRECT, 2) ;Oder "Top" statt 2.
	Local $iRight = DllStructGetData($tRECT, 3) ;Oder "Right" statt 3.
	Local $iBottom = DllStructGetData($tRECT, "Bottom") ;Oder 4 statt Bottom.


	; Gibt die Ressourcen, welche von der Struktur genutzt wurden, frei.
	$tRECT = 0

	; Zeigt die Ergebnisse von WinGetPos und dem zurückgegeben Rechteck an.
	MsgBox($MB_SYSTEMMODAL, "", "WinGetPos(): (" & $aWndPos[0] & ", " & $aWndPos[1] & ") " & _
			"(" & $aWndPos[2] + $aWndPos[0] & ", " & $aWndPos[3] + $aWndPos[1] & ")" & @CRLF & _
			"GetWindowRect(): (" & $iLeft & ", " & $iTop & ") (" & $iRight & ", " & $iBottom & ")")
EndFunc   ;==>Example
