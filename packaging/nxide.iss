; Інсталятор окремої програми Nx IDE для Windows - Inno Setup 6.
;   iscc /DMyVersion=1.0.0 /DSrcDir=<тека програми> /O<куди> packaging\nxide.iss
; Для поточного користувача (%LOCALAPPDATA%\Programs\Nx IDE) - без адміна,
; і кнопка «Оновити» в IDE може оновлювати файли сама.

#ifndef MyVersion
  #define MyVersion "0.0.0"
#endif
#ifndef SrcDir
  #define SrcDir "..\app"
#endif

[Setup]
AppId={{3C7A9E21-5B4D-4F6A-8E2C-91D0B7A6F4E3}
AppName=Nx IDE
AppVersion={#MyVersion}
AppVerName=Nx IDE {#MyVersion}
AppPublisher=Faneraiy14
AppPublisherURL=https://github.com/Faneraiy14/NyxilumIDE
AppSupportURL=https://github.com/Faneraiy14/NyxilumIDE/issues
DefaultDirName={autopf}\Nx IDE
DefaultGroupName=Nx IDE
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
OutputBaseFilename=NxIDE-win-x64-setup
SetupIconFile={#SrcDir}\ide\assets\icon.ico
UninstallDisplayIcon={app}\Nx IDE.exe
UninstallDisplayName=Nx IDE {#MyVersion}
LicenseFile={#SrcDir}\LICENSE
Compression=lzma2/max
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "uk"; MessagesFile: "compiler:Languages\Ukrainian.isl"
Name: "en"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "Ярлик «Nx IDE» на робочому столі"; GroupDescription: "Ярлики:"

[Files]
Source: "{#SrcDir}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\Nx IDE"; Filename: "{app}\Nx IDE.exe"; WorkingDir: "{userdocs}"
Name: "{group}\Видалити Nx IDE"; Filename: "{uninstallexe}"
Name: "{autodesktop}\Nx IDE"; Filename: "{app}\Nx IDE.exe"; WorkingDir: "{userdocs}"; Tasks: desktopicon

[Run]
Filename: "{app}\Nx IDE.exe"; WorkingDir: "{userdocs}"; Description: "Запустити Nx IDE"; Flags: postinstall nowait skipifsilent

[UninstallDelete]
; залишок оновлення (запущений Nx.exe перейменовується в .old)
Type: files; Name: "{app}\Nx.exe.old"
