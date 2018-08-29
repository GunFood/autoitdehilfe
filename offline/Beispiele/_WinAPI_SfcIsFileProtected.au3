#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

MsgBox($MB_SYSTEMMODAL, "Titel", 'Dateischutz Status = ' & _WinAPI_SfcIsFileProtected(@WindowsDir & "\explorer.exe"))
