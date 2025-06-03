#define MyAppName "OneClickPDF"
#define MyAppVersion "1.0"
#define MyAppPublisher "DaegalSoft"
#define MyAppURL "https://daegal.netlify.app/"
#define MyAppExeName "oneclickpdf.exe"

[Setup]
AppId={{AUTO_{#MyAppName}}}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={autopf}\{#MyAppName}
DisableProgramGroupPage=yes
OutputBaseFilename=OneClickPDF_Setup
Compression=lzma
SolidCompression=yes
WizardStyle=modern
UninstallDisplayIcon={app}\{#MyAppExeName}
ChangesAssociations=yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "D:\Freelance\DaegalSoft\dist\{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion

[Icons]

[Registry]
Root: HKCR; Subkey: "SystemFileAssociations\.jpg\shell\ConvertToPDF"; ValueType: string; ValueName: ""; ValueData: "Convert to PDF with {#MyAppName}"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.jpg\shell\ConvertToPDF"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\{#MyAppExeName},0"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "SystemFileAssociations\.jpg\shell\ConvertToPDF\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""; Flags: uninsdeletekey

Root: HKCR; Subkey: "SystemFileAssociations\.jpeg\shell\ConvertToPDF"; ValueType: string; ValueName: ""; ValueData: "Convert to PDF with {#MyAppName}"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.jpeg\shell\ConvertToPDF"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\{#MyAppExeName},0"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "SystemFileAssociations\.jpeg\shell\ConvertToPDF\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""; Flags: uninsdeletekey

Root: HKCR; Subkey: "SystemFileAssociations\.png\shell\ConvertToPDF"; ValueType: string; ValueName: ""; ValueData: "Convert to PDF with {#MyAppName}"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.png\shell\ConvertToPDF"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\{#MyAppExeName},0"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "SystemFileAssociations\.png\shell\ConvertToPDF\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""; Flags: uninsdeletekey

Root: HKCR; Subkey: "SystemFileAssociations\.bmp\shell\ConvertToPDF"; ValueType: string; ValueName: ""; ValueData: "Convert to PDF with {#MyAppName}"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.bmp\shell\ConvertToPDF"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\{#MyAppExeName},0"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "SystemFileAssociations\.bmp\shell\ConvertToPDF\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""; Flags: uninsdeletekey

Root: HKCR; Subkey: "SystemFileAssociations\.gif\shell\ConvertToPDF"; ValueType: string; ValueName: ""; ValueData: "Convert to PDF with {#MyAppName}"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.gif\shell\ConvertToPDF"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\{#MyAppExeName},0"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "SystemFileAssociations\.gif\shell\ConvertToPDF\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""; Flags: uninsdeletekey

Root: HKCR; Subkey: "SystemFileAssociations\.tif\shell\ConvertToPDF"; ValueType: string; ValueName: ""; ValueData: "Convert to PDF with {#MyAppName}"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.tif\shell\ConvertToPDF"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\{#MyAppExeName},0"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "SystemFileAssociations\.tif\shell\ConvertToPDF\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""; Flags: uninsdeletekey

Root: HKCR; Subkey: "SystemFileAssociations\.tiff\shell\ConvertToPDF"; ValueType: string; ValueName: ""; ValueData: "Convert to PDF with {#MyAppName}"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.tiff\shell\ConvertToPDF"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\{#MyAppExeName},0"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "SystemFileAssociations\.tiff\shell\ConvertToPDF\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""; Flags: uninsdeletekey

Root: HKCR; Subkey: "SystemFileAssociations\.webp\shell\ConvertToPDF"; ValueType: string; ValueName: ""; ValueData: "Convert to PDF with {#MyAppName}"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.webp\shell\ConvertToPDF"; ValueType: string; ValueName: "Icon"; ValueData: "{app}\{#MyAppExeName},0"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "SystemFileAssociations\.webp\shell\ConvertToPDF\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""; Flags: uninsdeletekey

[Code]
procedure SHChangeNotify(wEventId: Longint; uFlags: Longint; dwItem1: Longint; dwItem2: Longint);
  external 'SHChangeNotify@shell32.dll stdcall';

const
  SHCNE_ASSOCCHANGED = $08000000;
  SHCNF_IDLIST = $0000;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
  begin
    SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, 0, 0);
  end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  if CurUninstallStep = usPostUninstall then
  begin
    SHChangeNotify(SHCNE_ASSOCCHANGED, SHCNF_IDLIST, 0, 0);
  end;
end;