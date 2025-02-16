#include <APIShellExConstants.au3>
#include <WinAPIShellEx.au3>

ConsoleWrite('Windows => ' & _WinAPI_ShellGetSpecialFolderPath($CSIDL_WINDOWS) & @CRLF)
ConsoleWrite('System => ' & _WinAPI_ShellGetSpecialFolderPath($CSIDL_SYSTEM) & @CRLF)
ConsoleWrite('Schriftarten => ' & _WinAPI_ShellGetSpecialFolderPath($CSIDL_FONTS) & @CRLF)
ConsoleWrite('Program Files => ' & _WinAPI_ShellGetSpecialFolderPath($CSIDL_PROGRAM_FILES) & @CRLF)
ConsoleWrite('Profil => ' & _WinAPI_ShellGetSpecialFolderPath($CSIDL_PROFILE) & @CRLF)
ConsoleWrite('Meine Dokumente => ' & _WinAPI_ShellGetSpecialFolderPath($CSIDL_PERSONAL) & @CRLF)
ConsoleWrite('Startmenü => ' & _WinAPI_ShellGetSpecialFolderPath($CSIDL_STARTMENU) & @CRLF)
ConsoleWrite('Favoriten => ' & _WinAPI_ShellGetSpecialFolderPath($CSIDL_FAVORITES) & @CRLF)
ConsoleWrite('Desktop => ' & _WinAPI_ShellGetSpecialFolderPath($CSIDL_DESKTOP) & @CRLF)

ConsoleWrite('Ungültige CSIDL => "' & _WinAPI_ShellGetSpecialFolderPath(-1) & '" @error = ' & @error & ' @extended = 0x' & Hex(@extended) & @CRLF)
