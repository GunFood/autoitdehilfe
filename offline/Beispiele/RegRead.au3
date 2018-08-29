#include <MsgBoxConstants.au3>

Local $sFilePath = RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion", "ProgramFilesDir")
MsgBox($MB_SYSTEMMODAL, "Die Programmdateien sind gespeichert in:", $sFilePath)
