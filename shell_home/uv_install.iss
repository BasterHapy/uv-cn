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
; 原有文件复制逻辑不变
Source: ".local\*"; DestDir: "{userappdata}\..\..\.local"; Flags: onlyifdoesntexist recursesubdirs
Source: "uv\*"; DestDir: "{userappdata}\uv"; Flags: onlyifdoesntexist recursesubdirs createallsubdirs
Source: "AppData\uv\*"; DestDir: "{localappdata}\uv"; Flags: onlyifdoesntexist recursesubdirs

[Code]
procedure CurStepChanged(CurStep: TSetupStep);
var
  UserPath, NewPath: string;
  ResultCode: Integer;  // 补充ResultCode的变量声明
begin
  if CurStep = ssPostInstall then
  begin
    // 1. 动态生成当前用户的.local/bin路径
    UserPath := ExpandConstant('{userhome}\.local\bin');
    
    // 2. 读取现有用户Path环境变量（修正函数名）
    RegQueryStringValue(HKEY_CURRENT_USER, 'Environment', 'Path', NewPath);
    
    // 3. 简单检查路径是否已存在，不存在则拼接
    if Pos(Uppercase(UserPath), Uppercase(NewPath)) = 0 then
    begin
      if NewPath <> '' then NewPath := NewPath + ';';
      NewPath := NewPath + UserPath;
      
      // 4. 写入修改后的Path到注册表（修正函数名）
      RegWriteStringValue(HKEY_CURRENT_USER, 'Environment', 'Path', NewPath);
      
      // 5. 用setx命令通知系统更新环境变量
      Exec('cmd.exe', '/c setx Path "' + NewPath + '"', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
    end;
  end;
end;

