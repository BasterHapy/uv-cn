# uv-cn: uv 国内快速安装与使用

[![GitHub release](https://img.shields.io/github/v/release/Wangnov/uv-custom?display_name=tag&sort=semver&logo=github)](https://gitee.com/BasterHapy/uv-cn/releases)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

这是一个基于 [uv-custom/uv](https://gitee.com/wangnov/uv-custom)与[uv ](https://github.com/astral-sh/uv)的项目，旨在方便国内用户更容易，更快的使用`uv`这个工具。

## ✨ 项目特点

- **下载加速**：`uv`下载链接通过镜像代理，大幅提升下载速度。
- **预设镜像**：自动为您配置清华大学`PyPI`镜像和国内`cPython`镜像源。
- **一键安装**：提供平台原生的一键安装命令，无需手动下载或授权。
- **windows程序**：可直接在windows上安装与卸载
- **灵活配置**：您可以在运行一键安装命令时，通过设置 `UV_DOWNLOAD_PROXY` 和 `UV_PYPI_MIRROR` 环境变量来临时覆盖默认的下载代理和 PyPI 镜像源，以适应不同的网络环境。通过设置 `UV_VERSION` 来选择下载不同的uv版本。

👉 **[前往 Gitee Releases 页面](https://gitee.com/BasterHapy/uv-cn/releases)**

请在页面中找到最新的版本，并复制该版本下适合您操作系统的一键安装命令。


## ⚠️ 注意事项
由于国内网络问题，`uv`使用镜像下载源可能会出现问题，建议下载`windows`安装程序！
关于下载时临时切换国内`github`镜像代理`UV_DOWNLOAD_PROXY`,镜像代理地址参考阅[这里](https://jishuzhan.net/article/1965957555249266689#google_vignette)

## 🚀 一键安装
```powershell 
powershell -ExecutionPolicy Bypass -c "irm https://gitee.com/BasterHapy/uv-cn/releases/download/0.9.15/uv-install-cn.ps1 | iex"
```

## 🔧 参考项目
- [uv-custom gitee](https://gitee.com/wangnov/uv-custom)
- [uv-custom github](https://github.com/Wangnov/uv-custom)
- [uv 官方项目](https://github.com/astral-sh/uv)


## uv使用
- [uv中文文档](https://uv.oaix.tech/)
- [uv官方文档](https://docs.astral.sh/uv/)

## 🙏 致谢

- 本项目的基于 [astral-sh/uv](https://github.com/astral-sh/uv) 与 [uv-custom/uv](https://gitee.com/wangnov/uv-custom)
- 感谢所有提供高速、稳定镜像服务的贡献者。
- 感谢[wangnov](https://gitee.com/wangnov)

## 📄 许可证

本项目采用 [MIT](LICENSE) 许可证。

