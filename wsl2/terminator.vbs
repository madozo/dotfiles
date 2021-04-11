' https://medium.com/@bhupathy/install-terminator-on-windows-with-wsl-2826591d2156
set shell = WScript.CreateObject("Shell.Application")

if not IsProcessRunning("vcxsrv.exe") then
	shell.shellExecute "H:\tools\VcXsrv\vcxsrv.exe", ":0 -ac -terminate -lesspointer -multiwindow -clipboard -wgl -dpi auto", "C:\Program Files\VcXsrv", "", 0
end if

' terminator.vbs
myCd = "~"
If WScript.Arguments.Length > 0 Then
	myCd = "'$(wslpath -u '" & WScript.Arguments(0) & "')'"
End If
args = "bash" & " -c ""cd " & myCd & "; DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0 terminator"""
WScript.CreateObject("Shell.Application").ShellExecute "C:\Windows\System32\wsl.exe", args, "", "open", 0

' https://stackoverflow.com/questions/19794726/vb-script-how-to-tell-if-a-program-is-already-running
Function IsProcessRunning( strProcess )
	Dim Process, strObject
	IsProcessRunning = False
	strObject = "winmgmts://."
	For Each Process in GetObject( strObject ).InstancesOf( "win32_process" )
		If UCase( Process.name ) = UCase( strProcess ) Then
			IsProcessRunning = True
			Exit Function
		End If
	Next
End Function

