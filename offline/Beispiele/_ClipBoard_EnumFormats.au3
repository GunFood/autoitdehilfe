#include "Extras\HelpFileInternals.au3"

#include <Clipboard.au3>
#include <GUIConstantsEx.au3>
#include <WinAPIError.au3>
#include <WindowsStylesConstants.au3>

Example()

Func Example()
	Local $hGui, $iFormat, $iCount

	; Erstellt eine GUI
	$hGui = GUICreate("Zwischenablage", 600, 400)
	_MemoCreate(2, 2, 596, 396, $WS_VSCROLL)
	GUISetState(@SW_SHOW)

	; Öffnet die Zwischenablage
	If _ClipBoard_Open($hGui) Then

		; Liest die Anzahl der verschiedenen Datenformate aus, die in der Zwischenablage verfügbar sind
		_MemoWrite("Clipboard-Formate ..: " & _ClipBoard_CountFormats())

		; Auflisten der Clipboard-Formate
		Do
			$iFormat = _ClipBoard_EnumFormats($iFormat)
			If $iFormat <> 0 Then
				$iCount += 1
				_MemoWrite("Clipboard-Format " & $iCount & " .: " & _ClipBoard_FormatStr($iFormat))
			EndIf
		Until $iFormat = 0

		; Schließt die Zwischenablage
		_ClipBoard_Close()
	Else
		_WinAPI_ShowError("_ClipBoard_Open fehlgeschlagen!")
	EndIf

	; Die Schleife wiederholt sich, bis der Benutzer die Beenden-Aktion der GUI auslöst.
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE
EndFunc   ;==>Example