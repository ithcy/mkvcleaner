[Setup]
AppName=Strip MKV Titles
AppVersion=1.0
DefaultDirName={pf}\StripMKVTitles
DisableProgramGroupPage=yes
UninstallDisplayIcon={app}\stripmkvtitles.exe
OutputDir=.
OutputBaseFilename=StripMKVTitlesSetup

[Files]
Source: "dist\stripmkvtitles.exe"; DestDir: "{app}"
Source: "stripmkvtitles.py"; DestDir: "{app}"
Source: "mkvtoolnix\*"; DestDir: "{app}\mkvtoolnix"; Flags: ignoreversion recursesubdirs createallsubdirs

[Registry]
Root: HKCR; Subkey: "Directory\shell\StripMKVTitles"; Flags: uninsdeletekeyifempty
Root: HKCR; Subkey: "Directory\shell\StripMKVTitles"; ValueType: string; ValueName: ""; ValueData: "Strip MKV Titles"
Root: HKCR; Subkey: "Directory\shell\StripMKVTitles\command"; Flags: uninsdeletekeyifempty; ValueType: string; ValueName: ""; ValueData: """{app}\stripmkvtitles.exe"" ""%1"""

[Icons]
Name: "{group}\Strip MKV Titles"; Filename: "{app}\stripmkvtitles.exe"

[UninstallDelete]
Type: filesandordirs; Name: "{app}\*.*"
