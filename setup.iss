[Setup]
AppName=Strip MKV Titles
AppVersion=1.0
DefaultDirName={pf}\StripMKVTitles
DisableProgramGroupPage=yes
UninstallDisplayIcon={app}\stripmkvtitles.exe
OutputDir=.
OutputBaseFilename=SetupStripMKVTitles-x64
ArchitecturesInstallIn64BitMode=x64

[Dirs]
; Create the directory in the local app data folder
Name: "{localappdata}\StripMKVTitles"

[Files]
; Copy the executable to the program files directory
Source: "dist\stripmkvtitles.exe"; DestDir: "{app}"

; Copy config.toml to the local app data directory
Source: "src\config.toml"; DestDir: "{localappdata}\StripMKVTitles"; Flags: ignoreversion

; Create an empty log file in the local app data directory
Source: "src\stripmkvtitles.log"; DestDir: "{localappdata}\StripMKVTitles"; Flags: ignoreversion


[Registry]
; Add context menu entry for folders

Root: HKCR; Subkey: "Directory\Background\shell\StripMKVTitles"; \
ValueType: string; \
ValueName: ""; \
ValueData: "&Strip MKV Titles"; \
Flags: createvalueifdoesntexist

Root: HKCR; Subkey: "Directory\Background\shell\StripMKVTitles\command"; \
ValueType: string; \
ValueName: ""; \
ValueData: """{app}\stripmkvtitles.exe"""; \
Flags: createvalueifdoesntexist


Root: HKCR; Subkey: "Directory\shell\StripMKVTitles"; \
Flags: createvalueifdoesntexist

Root: HKCR; Subkey: "Directory\shell\StripMKVTitles"; \
ValueType: string; \
ValueName: ""; \
ValueData: "&Strip MKV Titles"; \
Flags: createvalueifdoesntexist

Root: HKCR; Subkey: "Directory\shell\StripMKVTitles\command"; \
ValueType: string; \
ValueName: ""; \
ValueData: """{app}\stripmkvtitles.exe"" ""%1"""; \
Flags: createvalueifdoesntexist

Root: HKCR; Subkey: "SystemFileAssociations\.mkv\Shell\Strip MKV Titles"; \
Flags: createvalueifdoesntexist

Root: HKCR; Subkey: "SystemFileAssociations\.mkv\Shell\Strip MKV Titles\command"; \
ValueType: string; \
ValueName: ""; \
ValueData: """{app}\stripmkvtitles.exe"" ""%1"""; \
Flags: createvalueifdoesntexist


[Icons]
Name: "{group}\Strip MKV Titles"; Filename: "{app}\stripmkvtitles.exe"

[UninstallDelete]
Type: filesandordirs; Name: "{app}\*.*"

[Registry]
Root: HKCR; Subkey: "Directory\Background\shell\StripMKVTitles"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Directory\shell\StripMKVTitles"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.mkv\Shell\Strip MKV Titles";  Flags: uninsdeletekey
