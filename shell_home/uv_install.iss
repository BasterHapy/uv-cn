
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
; 1. 复制 .local 文件夹到用户主目录 (C:\Users\{用户名}\.local)
Source: ".local\*"; DestDir: "{userappdata}\..\..\.local"; Flags: onlyifdoesntexist recursesubdirs

; 2. 复制 uv 文件夹到 Roaming 应用数据 (C:\Users\{用户名}\AppData\Roaming\uv)
; 注意：确保 uv 文件夹和 .iss 脚本文件在同一目录下
Source: "uv\*"; DestDir: "{userappdata}\uv"; Flags: onlyifdoesntexist recursesubdirs createallsubdirs
; 补充 createallsubdirs 确保目标目录不存在时自动创建，减少报错

; 3. 复制 AppData\uv 文件夹到 Local 应用数据 (C:\Users\{用户名}\AppData\Local\uv)
Source: "AppData\uv\*"; DestDir: "{localappdata}\uv"; Flags: onlyifdoesntexist recursesubdirs