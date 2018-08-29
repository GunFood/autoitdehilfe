#include <GUIConstantsEx.au3>
#include <TreeviewConstants.au3>
#include <WindowsConstants.au3>



Opt("WinTitleMatchMode", 2)

; Bei den Sounds "Windows-Abmeldung" ausw�hlen

$titel = "Eigenschaften von Sounds und Audioger�te"

; Sounds und Audioger�te starten
Run("rundll32.exe shell32.dll,Control_RunDLL mmsys.cpl,,1")
WinWait($titel)

;"Windows-Abmeldung" ausw�hlen
$Eintragsname = "Windows-Abmeldung"
$winhandle = WinGetHandle($titel)
$treehandle = ControlGetHandle($winhandle, '', "SysTreeView321")
ControlFocus($winhandle, '', $treehandle)
ControlTreeView($winhandle, "", 6682, "Select", "Windows|" & $Eintragsname)
