# FastAPI 快速启动脚本

```bash
curl -fsSL https://raw.githubusercontent.com/wheelo/fastapi-setup.sh/refs/heads/main/fastapi-setup.sh | source /dev/stdin
```

使用 [uv](https://github.com/astral-sh/uv) 与 [poetry](https://python-poetry.org) 和虚拟环境快速设置和运行 [fastAPI](https://fastapi.tiangolo.com) 项目的自动化脚本

## 功能特点

- 自动创建和管理 Python 虚拟环境
- 使用 Poetry 进行依赖管理
- 自动安装 FastAPI 和 Uvicorn
- 提供基础的 API 示例
- 支持热重载开发模式

## 本地使用方法

运行脚本：
```bash
source fastapi-setup.sh