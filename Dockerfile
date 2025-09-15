FROM python:3.10-slim

WORKDIR /app

COPY . /app

# 如果有依赖文件 requirements.txt，请取消下一行注释
# RUN pip install --no-cache-dir -r requirements.txt

# 默认启动命令，请将 app.py 替换为你的主程序文件
# CMD ["python", "app.py"]

# 如有需要暴露端口（比如 Flask 默认5000），取消下一行注释
# EXPOSE 5000
