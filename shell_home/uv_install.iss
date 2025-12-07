[Setup]
AppName=uv Installer
AppVersion=0.9.15.s
DefaultDirName={pf}\uv
DefaultGroupName=uv
OutputBaseFilename=uv_installer
PrivilegesRequired=admin
Compression=lzma2
SolidCompression=yes
; 这一行确保安装后环境变量立即生效
ChangesEnvironment=yes

[Files]
; 修正：使用 {%USERPROFILE} 代表 C:\Users\用户名
Source: ".local\*"; DestDir: "{%USERPROFILE}\.local"; Flags: onlyifdoesntexist recursesubdirs
Source: "uv\*"; DestDir: "{userappdata}\uv"; Flags: onlyifdoesntexist recursesubdirs createallsubdirs
Source: "AppData\uv\*"; DestDir: "{localappdata}\uv"; Flags: onlyifdoesntexist recursesubdirs

[Registry]
; 修正：使用 {%USERPROFILE} 并配合 Check 函数
Root: HKCU; Subkey: "Environment"; ValueName: "Path"; ValueType: expandsz; ValueData: "{olddata};{%USERPROFILE}\.local\bin"; Check: NeedsAddPath('{%USERPROFILE}\.local\bin')

[Code]
// 检查路径是否已经存在，避免重复追加
function NeedsAddPath(Param: string): boolean;
var
  OrigPath: string;
  ResolvedPath: string;
begin
  // 核心修复：将 {%USERPROFILE} 解析为真实路径 (如 C:\Users\admin)
  ResolvedPath := ExpandConstant(Param);

  // 读取当前的 Path 环境变量
  if not RegQueryStringValue(HKEY_CURRENT_USER, 'Environment', 'Path', OrigPath) then
  begin
    // 如果读取失败（极其罕见），默认允许添加
    Result := True;
    exit;
  end;
  
  // 检查是否包含。前后加分号是为了防止 "abc\bin" 匹配到 "abc\bin2"
  // 如果找不到 (Pos 返回 0)，则返回 True (需要添加)
  Result := Pos(';' + ResolvedPath + ';', ';' + OrigPath + ';') = 0;
end;