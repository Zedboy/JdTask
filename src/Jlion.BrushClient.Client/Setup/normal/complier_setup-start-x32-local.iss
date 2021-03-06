; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "每日付收款精灵"
#define MyAppVersion "1.3.3-pre01"
#define MyAppPublisher "杭州微盘信息技术有限公司"
#define MyAppURL "http://www.payweipan.com/"
#define MyAppExeName "WP.Device.Plugins.StartClient.exe"
#define ProcessExeName "WP.Device.Plugins.StartClient.exe"
;#define IncludeFramework true
;#define IsExternal ""

[Setup]
; NOTE: The value of AppId uniquely identifies this application. Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{97401B87-06E9-4274-B364-634E8F35138E}
PrivilegesRequired=none
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={localappdata}\{#MyAppName}
DisableProgramGroupPage=yes
;PrivilegesRequired=admin
; The [Icons] "quicklaunchicon" entry uses {userappdata} but its [Tasks] entry has a proper IsAdminInstallMode Check.
;UsedUserAreasWarning=no
; Uncomment the following line to run in non administrative install mode (install for current user only.)
;PrivilegesRequired=lowest
OutputDir=每日付收款精灵
OutputBaseFilename=每日付收款精灵-{#MyAppVersion}
;SetupIconFile=logo.ico
SetupIconFile=logo.ico
Compression=lzma
SolidCompression=yes
;OutputDir=userdocs:Inno Setup Examples Output
; "ArchitecturesInstallIn64BitMode=x64" requests that the install be
; done in "64-bit mode" on x64, meaning it should use the native
; 64-bit Program Files directory and the 64-bit view of the registry.
; On all other architectures it will install in "32-bit mode".
;ArchitecturesInstallIn64BitMode=x64
; Note: We don't set ProcessorsAllowed because we want this
; installation to run on all architectures (including Itanium,
; since it's capable of running 32-bit code too).

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 6.1; 


[Files]
Source: "Out\WP.Device.Plugins.StartClient.exe"; DestDir: "{app}"; Flags: ignoreversion; 
Source: "..\..\Setup\normal\Out\WP.Device.Plugins.StartClient.exe"; DestDir: "{app}"; Flags: ignoreversion;
;#if IncludeFramework
;Source: "..\Setup\Out\dotNetFx40_Full_x86_x64.exe"; DestDir: "{tmp}"; Flags: ignoreversion {#IsExternal}; Check: NeedsFramework
;#endif

Source: "..\..\Setup\normal\Out\\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
;Source: "..\OutApp\WeChatPersonManage-win32-x64\WeChatPersonManage.exe"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
;Source: compiler:psvince.dll; Flags: dontcopy noencryption  
;Source: compiler:IsTask.dll; Flags: dontcopy noencryption
;NOTE: Don't use "Flags: ignoreversion" on any shared system files


[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

; 在开始菜单
Name: "{commonstartmenu}\{#MyAppName}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}";  
Name: "{commonstartmenu}\{#MyAppName}\卸载{#MyAppName}"; Filename: "uninstall"; 

[Run]
;#if IncludeFramework
;Filename: {tmp}\dotNetFx40_Full_x86_x64.exe; Parameters: "/q:a /c:""install /l /q"""; WorkingDir: {tmp}; Flags: skipifdoesntexist; StatusMsg: "Installing .NET Framework if needed"
;#endif

Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

;[code]
; Indicates whether .NET Framework 2.0 is installed.
;function IsDotNET40Detected(): boolean;
;var
;    success: boolean;
;    install: cardinal;
;begin
;    success := RegQueryDWordValue(HKLM, 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full', 'Install', install);
;     //success := RegQueryDWordValue(HKLM, 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v2.0.50727', 'Install', install);
;    Result :=  success and (install = 1);
;end;
 
;function NeedsFramework(): Boolean;
;begin
;  Result := (IsDotNET40Detected = false);
;end;
[Code]  
function InitializeSetup(): boolean;  
var  
  ResultStr: String;  
  ResultCode: Integer;  
begin  
  if RegQueryStringValue(HKLM, 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{97401B87-06E9-4274-B364-634E8F35138E}_is1', 'UninstallString', ResultStr) then  
    begin  
      ResultStr := RemoveQuotes(ResultStr);  
      Exec(ResultStr, '/silent', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);  
    end;  
    result := true;  
end;


