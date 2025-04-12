#!/bin/bash

# 检查是否存在 .venv 目录来判断是否首次运行
if [ ! -d ".venv" ]; then
    echo "首次运行，开始设置环境..."
    # 安全地退出虚拟环境
    if [ -n "$VIRTUAL_ENV" ]; then
        deactivate
    fi
    # 创建并激活虚拟环境
    uv venv --python 3.12.1
    source .venv/bin/activate

    # 创建项目目录
    mkdir -p example/fastapi && cd $_

    # 安装和配置 poetry
    uv pip install poetry

    # 删除已存在的 pyproject.toml（如果存在）
    rm -f pyproject.toml

    # 初始化 poetry 项目
    poetry init --name "fastapi-demo" --no-interaction
    poetry add fastapi uvicorn

    # 创建 main.py 文件
    cat > main.py << 'EOL'
    # 创建 main.py 文件
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
async def root():
    return {"message": "Hello World"}
EOL

    # 显示环境信息
    poetry env info
else
    source .venv/bin/activate
    poetry env info
    echo "环境已存在，直接启动服务..."
fi

# cd $(dirname $0)  # 回到脚本所在目录

# 启动 FastAPI 服务
# cd $(dirname $0)
echo "当前目录: $(pwd)"
# cd example/fastapi
poetry run uvicorn main:app --reload --log-level info
