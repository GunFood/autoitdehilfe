;Beispiel zum Problem bei @SW_MAXIMIZE (siehe Bemerkungen oben)
;-- TIME_STAMP   2018-01-01 11:22:43   v 0.1

#include <GUIConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

Global $WIN_STATE_VISIBLE   = 2        ; Fenster ist sichtbar.
Global $WIN_STATE_MINIMIZED = 16    ; Fenster ist minimiert.
Global $WIN_STATE_MAXIMIZED = 32    ; Fenster ist maximiert.

#Region - GUI Create
Local $hGUI = GUICreate('ControlGetPos-Test', 400, 200)
Local $idButton = GUICtrlCreateButton('Exit', 10, 10, 380, 25)
#EndRegion

; Position wie beim Erstellen angegeben
GUISetState($hGUI)
_GetControlPos($hGUI, 'ControlGetPos-Test', $idButton)

; Maximieren
GUISetState(@SW_MAXIMIZE, $hGUI)
_GetControlPos($hGUI, 'ControlGetPos-Test', $idButton) ;>>> lieferte falsche Werte, siehe roter Text in der Console

; Restaurierte Position - wie beim Erstellen angegeben.
GUISetState(@SW_RESTORE, $hGUI)
_GetControlPos($hGUI, 'ControlGetPos-Test', $idButton)

; Minimieren
GUISetState(@SW_MINIMIZE, $hGUI)
_GetControlPos($hGUI, 'ControlGetPos-Test', $idButton)

;~ Exit

Func _GetControlPos($hWnd, $sText, $iCtrlID)
    Local Static $iHeader, $aHeader = ['WinPos ($hGUI)', 'CtrlPos ($idButton)', '$WIN_STATE_VISIBLE', '$WIN_STATE_MINIMIZED', '$WIN_STATE_MAXIMIZED', '@SW_RESTORE']

    Local $aWinPos = WinGetPos($hWnd)
    Local $aCtrlPos = ControlGetPos($hWnd, $sText, $iCtrlID)

    Local $iState = WinGetState($hWnd), $aState[1][4], $sColor

    If BitAND($iState, $WIN_STATE_VISIBLE)   = $WIN_STATE_VISIBLE Then
        $aState[0][0] = 'Fenster ist sichtbar'
        If BitAND($iState, $WIN_STATE_MAXIMIZED) = $WIN_STATE_MAXIMIZED Then
            $aState[0][1] = 'Fenster ist maximiert.'
            $sColor = '!'
        ElseIf BitAND($iState, $WIN_STATE_MINIMIZED) = $WIN_STATE_MINIMIZED Then
            $aState[0][2] = 'Fenster ist minimiert.'
            $sColor = '-'
        Else
            $aState[0][3] = 'Restaurierte Position - wie beim Erstellen angegeben.'
            $sColor = '+'
        EndIf
    Else
        $aState[0][0] = 'Fenster ist nicht sichtbar.'
        $sColor = '@'
    EndIf

    If $iHeader = '' Then
        ConsoleWrite(StringFormat('> %-42s | %-42s | %-30s | %-23s | %-23s |%s\r', $aHeader[0], $aHeader[1], $aHeader[2], $aHeader[3], $aHeader[4], $aHeader[5]))
        $iHeader = True
    EndIf
    ConsoleWrite(StringFormat('%s x:%7i, y:%7i, w:%7i, h:%7i | x:%7i, y:%7i, w:%7i, h:%7i | %-30s | %-23s | %-23s | %-30s\r', _
        $sColor, _
        $aWinPos[0], $aWinPos[1], $aWinPos[2], $aWinPos[3], _
        $aCtrlPos[0], $aCtrlPos[1], $aCtrlPos[2], $aCtrlPos[3], _
        $aState[0][0], $aState[0][1], $aState[0][2], $aState[0][3]))
EndFunc

#Region - GUI SwitchLoop
;~ Local $iState
;~ While True
;~     Switch GUIGetMsg()
;~         Case $GUI_EVENT_CLOSE, $idButton
;~             Exit
;~     EndSwitch
;~ WEnd
#EndRegion