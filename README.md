# uv-custom: uv 国内加速镜像

[![GitHub release](https://img.shields.io/github/v/release/Wangnov/uv-custom?display_name=tag&sort=semver&logo=github)](https://github.com/Wangnov/uv-custom/releases/latest)
[![Sync Status](https://github.com/Wangnov/uv-custom/actions/workflows/sync_release.yml/badge.svg)](https://github.com/Wangnov/uv-custom/actions/workflows/sync_release.yml)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

这是一个与 [uv-custom/uv](https://gitee.com/wangnov/uv-custom) 同步的镜像项目，旨在通过使用国内的`cpython`源来进一步提升下载速度。

## ✨ 项目特点

- **下载加速**：所有 GitHub 下载链接均通过镜像代理，大幅提升下载速度。
- **预设镜像**：自动为您配置清华大学 PyPI 镜像和 Python 构建镜像。
- **一键安装**：提供平台原生的一键安装命令，无需手动下载或授权。
- **灵活配置**：您可以在运行一键安装命令时，通过设置 `UV_DOWNLOAD_PROXY` 和 `UV_PYPI_MIRROR` 环境变量来临时覆盖默认的下载代理和 PyPI 镜像源，以适应不同的网络环境。通过设置 `UV_VERSION` 来选择下载不同的uv版本。
- **国内cpython镜像***: 使用国内的镜像站，大幅提升下载速度。

## 🚀 快速安装

由于安装脚本是动态生成的，请访问项目的发布页面，以获取最新的一键安装命令。

### Gitee (主推)

我们强烈推荐您通过 Gitee 的发布页面进行安装，以确保所有下载资源均来自国内服务器，实现纯净、高速的国内网络安装体验。

👉 **[前往 Gitee Releases 页面](https://gitee.com/wangnov/uv-custom/releases)**

请在页面中找到最新的版本，并复制该版本下适合您操作系统的一键安装命令。

## 🔧 参考项目
- [uv 国内加速镜像-gitee](https://gitee.com/wangnov/uv-custom)
- [uv 国内加速镜像-github](https://github.com/Wangnov/uv-custom)
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