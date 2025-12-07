[Setup]
AppName=uv Installer
AppVersion=0.9.15.s
DefaultDirName={pf}\uv
DefaultGroupName=uv
OutputBaseFilename=uv_installer
PrivilegesRequired=admin
Compression=lzma2
SolidCompression=yes

[Files]
Source: ".local\*"; DestDir: "{userappdata}\..\..\.local"; Flags: onlyifdoesntexist recursesubdirs
Source: "uv\*"; DestDir: "{userappdata}\uv"; Flags: onlyifdoesntexist recursesubdirs createallsubdirs
Source: "AppData\uv\*"; DestDir: "{localappdata}\uv"; Flags: onlyifdoesntexist recursesubdirs

[Code]
procedure CurStepChanged(CurStep: TSetupStep);
var
  UserPath, NewPath: string;
  ResultCode: Integer;
begin
  if CurStep = ssPostInstall then
  begin
  
    UserPath := ExpandConstant('{userprofile}\.local\bin');
    
    RegQueryStringValue(HKEY_CURRENT_USER, 'Environment', 'Path', NewPath);
    
    if Pos(Uppercase(UserPath), Uppercase(NewPath)) = 0 then
    begin
      if NewPath <> '' then NewPath := NewPath + ';';
      NewPath := NewPath + UserPath;
      
      RegWriteStringValue(HKEY_CURRENT_USER, 'Environment', 'Path', NewPath);
      Exec('cmd.exe', '/c setx Path "' + NewPath + '"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
    end;
  end;
end;
