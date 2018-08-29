#include <Inet.au3>
#include <MsgBoxConstants.au3>

MsgBox($MB_SYSTEMMODAL, "", _INetExplorerCapable(InputBox("", "Gib einen String ein, der in einen Text umgewandelt werden soll, der vom Browser gelesen werden kann:")))
