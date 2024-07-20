[Setup]
AppName=mkvcleaner
AppVersion=1.0
DefaultDirName={pf}\mkvcleaner
DisableProgramGroupPage=yes
UninstallDisplayIcon={app}\mkvcleaner.exe
OutputDir=.
OutputBaseFilename=Setupmkvcleaner-x64
ArchitecturesInstallIn64BitMode=x64

[Dirs]
; Create the directory in the local app data folder
Name: "{localappdata}\mkvcleaner"

[Files]
; Copy the executable to the program files directory
Source: "dist\mkvcleaner.exe"; DestDir: "{app}"

; Copy config.toml to the local app data directory
Source: "src\config.toml"; DestDir: "{localappdata}\mkvcleaner"; Flags: ignoreversion

; Create an empty log file in the local app data directory
Source: "src\mkvcleaner.log"; DestDir: "{localappdata}\mkvcleaner"; Flags: ignoreversion


[Registry]
; Add context menu entry for folders

Root: HKCR; Subkey: "Directory\Background\shell\mkvcleaner"; \
ValueType: string; \
ValueName: ""; \
ValueData: "&mkvcleaner"; \
Flags: createvalueifdoesntexist

Root: HKCR; Subkey: "Directory\Background\shell\mkvcleaner\command"; \
ValueType: string; \
ValueName: ""; \
ValueData: """{app}\mkvcleaner.exe"""; \
Flags: createvalueifdoesntexist


Root: HKCR; Subkey: "Directory\shell\mkvcleaner"; \
Flags: createvalueifdoesntexist

Root: HKCR; Subkey: "Directory\shell\mkvcleaner"; \
ValueType: string; \
ValueName: ""; \
ValueData: "&mkvcleaner"; \
Flags: createvalueifdoesntexist

Root: HKCR; Subkey: "Directory\shell\mkvcleaner\command"; \
ValueType: string; \
ValueName: ""; \
ValueData: """{app}\mkvcleaner.exe"" ""%1"""; \
Flags: createvalueifdoesntexist

Root: HKCR; Subkey: "SystemFileAssociations\.mkv\Shell\mkvcleaner"; \
Flags: createvalueifdoesntexist

Root: HKCR; Subkey: "SystemFileAssociations\.mkv\Shell\mkvcleaner\command"; \
ValueType: string; \
ValueName: ""; \
ValueData: """{app}\mkvcleaner.exe"" ""%1"""; \
Flags: createvalueifdoesntexist


[Icons]
Name: "{group}\mkvcleaner"; Filename: "{app}\mkvcleaner.exe"

[UninstallDelete]
Type: filesandordirs; Name: "{app}\*.*"

[Registry]
Root: HKCR; Subkey: "Directory\Background\shell\mkvcleaner"; Flags: uninsdeletekey
Root: HKCR; Subkey: "Directory\shell\mkvcleaner"; Flags: uninsdeletekey
Root: HKCR; Subkey: "SystemFileAssociations\.mkv\Shell\mkvcleaner";  Flags: uninsdeletekey
