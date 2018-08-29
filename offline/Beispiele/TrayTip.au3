#include <MsgBoxConstants.au3>
#include <TrayConstants.au3>

TrayTip("Ich bin ein Titel", "Ich bin die Nachricht", 0, $TIP_ICONASTERISK)
MsgBox($MB_SYSTEMMODAL, "", "Klicke auf OK um einen weiteren Traytip zu sehen.")
TrayTip("Leert einen Traytip", "", 0)
MsgBox($MB_SYSTEMMODAL, "", "Klicke auf OK um einen weiteren Traytip zu sehen.")
TrayTip("", "Ein anderer Traytip.", 5)
Sleep(5000)
