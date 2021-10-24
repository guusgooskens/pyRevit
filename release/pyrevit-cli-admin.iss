#define MyAppName "pyRevit CLI"
#define MyAppUUID "e5f33f30-e03d-452f-8720-7a0f49c89b5c"
#define MyAppVersion "4.8.9.2922105"
#define MyAppPublisher "pyRevitLabs"
#define MyAppURL "pyrevitlabs.io"
#define MyAppExeName "pyrevit.exe"

[Setup]
; App information
AppId={#MyAppUUID}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
AppCopyright=Copyright (C) 2014-2019 pyRevitLabs.io
LicenseFile=..\LICENSE.txt
; Installer
DefaultGroupName={#MyAppName}
DisableStartupPrompt=yes
DisableProgramGroupPage=yes
ArchitecturesInstallIn64BitMode=x64
ChangesEnvironment=yes
;     path
DefaultDirName={autopf}\{#MyAppName}
UsePreviousAppDir=yes
;     mode
PrivilegesRequired=admin
; Build info
OutputDir=..\dist
OutputBaseFilename=pyRevit_CLI_{#MyAppVersion}_admin_signed
SetupIconFile=..\bin\pyrevit_cli.ico
Compression=lzma
SolidCompression=yes
DisableWelcomePage=no
WizardStyle=classic
WizardImageFile=.\pyrevit-cli.bmp
WizardSmallImageFile=.\pyrevit-banner.bmp

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
; bin\
Source: "..\bin\*"; DestDir: "{app}\bin"; Flags: ignoreversion

[Registry]
; Uninstaller does not undo this change
; Multiple installs keep adding the path
; https://stackoverflow.com/a/3431379/2350244
; https://stackoverflow.com/a/9962307/2350244 (mod path module)
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: expandsz; ValueName: "Path"; ValueData: "{olddata};{app}\bin"

[Run]
Filename: "{app}\bin\pyrevit.exe"; Description: "Clearning caches..."; Parameters: "caches clear --all"; Flags: runhidden runascurrentuser
Filename: "{app}\bin\pyrevit.exe"; Description: "Detach existing clones..."; Parameters: "detach --all"; Flags: runhidden runascurrentuser

[UninstallRun]
Filename: "{app}\bin\pyrevit.exe"; RunOnceId: "ClearCaches"; Parameters: "caches clear --all"; Flags: runhidden runascurrentuser
Filename: "{app}\bin\pyrevit.exe"; RunOnceId: "DetachClones"; Parameters: "detach --all"; Flags: runhidden runascurrentuser