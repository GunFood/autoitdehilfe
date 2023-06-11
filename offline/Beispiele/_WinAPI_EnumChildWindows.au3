#include <Array.au3>
#include <WinAPISysWin.au3>

Local $hForm = GUICreate('Test ' & StringReplace(@ScriptName, '.au3', '()'), 310, 360)
GUISetFont(8.5, 400, 0, 'MS Shell Dlg', $hForm)
GUICtrlCreateGroup('Gruppe', 10, 10, 140, 95)
GUICtrlCreateCheckbox('Checkbox 1', 22, 26, 120, 23)
GUICtrlCreateCheckbox('Checkbox 2', 22, 49, 120, 23)
GUICtrlCreateCheckbox('Checkbox 3', 22, 72, 120, 23)
GUICtrlCreateGroup('Gruppe', 160, 10, 140, 95)
GUICtrlCreateRadio('Radio-Button 1', 172, 26, 120, 23)
GUICtrlCreateRadio('Radio-Button 2', 172, 49, 120, 23)
GUICtrlCreateRadio('Radio-Button 3', 172, 72, 120, 23)
GUICtrlCreateButton('OK', 120, 330, 70, 23)
GUICtrlCreateTab(10, 118, 292, 206)
GUICtrlCreateTabItem('Tabulator 1')
GUICtrlCreateTabItem('Tabulator 2')
GUICtrlCreateTabItem('')
GUISetState(@SW_SHOW)

Local $aData = _WinAPI_EnumChildWindows($hForm)

_ArrayDisplay($aData, '_WinAPI_EnumChildWindows')

GUIDelete()
