# 邮件查看系统 (Mail Retrieval System) v2.0

一个基于 Python Flask 框架开发的现代化邮件查看系统，支持 IMAP/POP3 协议，具备完整的后台管理功能、卡密系统、代理池支持和移动端适配。

## 🌟 项目特性

### 核心功能
- 🐍 **Python Flask**：基于现代化的 Python Web 框架构建，易于维护和扩展
- 📧 **多协议支持**：支持 IMAP 和 POP3 协议，可选择 SSL 安全连接
- 🔧 **完整后台管理**：功能齐全的管理员控制面板，支持邮箱账号的增删改查
- 🔑 **高级卡密系统**：支持卡密生成、使用限制、过期时间、绑定邮箱等功能
- 🌐 **代理池支持**：集成 HTTP 和 SOCKS5 代理池，支持代理连接和自动故障切换
- 📱 **响应式设计**：完美适配 PC、平板和移动端，移动端导航优化
- 🎨 **现代化界面**：渐变背景、动画效果、暗黑模式支持

### 数据库兼容性
- 🗄️ **SQLite**：默认轻量级数据库，无需复杂配置
- 🐬 **MySQL**：支持 MySQL 5.7+ 和 8.0+，适合大型部署
- 🐘 **PostgreSQL**：支持 PostgreSQL 12+，企业级数据库支持

### 安全性
- 🛡️ **管理员验证**：完整的登录验证系统，密码加密存储
- 🔐 **会话管理**：安全的会话管理机制
- 📋 **访问日志**：详细的用户访问和操作日志记录
- 🚫 **权限控制**：细粒度的权限控制和访问限制

## 🚀 技术栈

### 后端技术
- **Python 3.12+**：现代化 Python 版本
- **Flask 3.0+**：轻量级 Web 框架
- **SQLite/MySQL/PostgreSQL**：多数据库支持
- **IMAPClient**：专业的 IMAP 客户端库
- **PySocks**：SOCKS 代理支持

### 前端技术
- **HTML5**：语义化标记
- **CSS3**：现代化样式，Grid/Flexbox 布局
- **JavaScript (ES6+)**：现代化前端交互
- **响应式设计**：移动优先的设计理念

## 📁 项目结构

```
mail-915/
├── app.py                          # Flask 主应用文件
├── requirements.txt                # Python 依赖包清单
├── install.sh                      # 自动安装脚本
├── templates/                      # Jinja2 模板文件
│   ├── base.html                   # 基础模板
│   ├── frontend/                   # 前端用户界面
│   │   └── index.html             # 邮件查看主页面
│   └── admin/                      # 后台管理界面
│       ├── login.html             # 管理员登录页面
│       ├── home.html              # 管理员首页（已优化移动端）
│       ├── mailbox.html           # 邮箱账号管理
│       ├── daili.html             # 代理池管理
│       ├── kami.html              # 卡密管理
│       ├── kamirizhi.html         # 卡密使用日志
│       ├── shoujian.html          # 收件日志
│       └── system.html            # 系统设置
├── python/                         # Python 邮件处理模块
│   ├── mail_fetcher.py            # 邮件获取器（支持代理）
│   └── requirements.txt           # 邮件模块依赖
├── db/                            # 数据库相关文件
│   ├── init.sql                   # 数据库初始化脚本
│   └── *.sqlite                   # SQLite 数据库文件（自动创建）
└── README.md                      # 项目说明文档
```

## 🔧 系统要求

### 基础环境
- **Python 版本**：3.12 或以上
- **操作系统**：Linux/Windows/macOS
- **内存要求**：最低 512MB，推荐 1GB+
- **磁盘空间**：最低 100MB

### 数据库要求
- **SQLite**：Python 内置，无需额外安装
- **MySQL**：5.7+ 或 8.0+
- **PostgreSQL**：12+

## 📦 安装部署

### 方法一：自动安装（推荐）

```bash
# 下载项目
git clone <repository-url>
cd mail-915

# 运行自动安装脚本
chmod +x install.sh
./install.sh
```

### 方法二：手动安装

#### 1. 环境准备

```bash
# 确保 Python 3.12+ 已安装
python3 --version

# 创建虚拟环境（推荐）
python3 -m venv venv
source venv/bin/activate  # Linux/macOS
# 或 venv\Scripts\activate  # Windows
```

#### 2. 安装依赖

```bash
# 安装主要依赖
pip install -r requirements.txt

# 安装邮件处理依赖
pip install -r python/requirements.txt
```

#### 3. 数据库配置

##### SQLite（默认，推荐入门）
```bash
# 无需额外配置，应用启动时自动创建
python3 app.py
```

##### MySQL配置
```bash
# 设置环境变量
export DATABASE_TYPE=mysql
export MYSQL_HOST=localhost
export MYSQL_USER=your_username
export MYSQL_PASSWORD=your_password
export MYSQL_DATABASE=mail_system

# 启动应用
python3 app.py
```

##### PostgreSQL配置
```bash
# 设置环境变量
export DATABASE_TYPE=postgresql
export POSTGRES_HOST=localhost
export POSTGRES_USER=your_username
export POSTGRES_PASSWORD=your_password
export POSTGRES_DATABASE=mail_system

# 启动应用
python3 app.py
```

#### 4. 启动应用

##### 开发环境
```bash
python3 app.py
# 访问 http://localhost:8005
```

##### 生产环境
```bash
# 使用 Gunicorn（推荐）
pip install gunicorn
gunicorn -w 4 -b 0.0.0.0:8005 app:app

# 使用 uWSGI
pip install uwsgi
uwsgi --http :8005 --wsgi-file app.py --callable app

# 使用 Supervisor 守护进程
sudo apt install supervisor
# 配置 supervisor 配置文件
```

### 方法三：Docker 部署

```dockerfile
# Dockerfile
FROM python:3.12-slim

WORKDIR /app
COPY . .

RUN pip install -r requirements.txt
RUN pip install -r python/requirements.txt

EXPOSE 8005

CMD ["python3", "app.py"]
```

```bash
# 构建和运行
docker build -t mail-system .
docker run -p 8005:8005 mail-system
```

## ⚙️ 系统配置

### 1. 管理员账号

**默认管理员账号**：
- 用户名：`admin`
- 密码：`admin`

**首次登录后请立即**：
1. 访问 `http://你的域名:8005/admin`
2. 使用默认账号登录
3. 进入"系统设置"修改管理员账号和密码

### 2. 邮箱配置

#### 常用邮箱服务器配置参考

**QQ邮箱（推荐）**
- 服务器：`imap.qq.com`
- 端口：`993`
- 协议：IMAP
- SSL：开启
- 密码：授权码（非QQ密码）
- 获取授权码：QQ邮箱设置 → 账户 → 生成授权码

**163邮箱**
- 服务器：`imap.163.com`
- 端口：`993`
- 协议：IMAP
- SSL：开启
- 密码：授权码

**Gmail**
- 服务器：`imap.gmail.com`
- 端口：`993`
- 协议：IMAP
- SSL：开启
- 密码：应用专用密码

**Outlook/Hotmail**
- 服务器：`outlook.office365.com`
- 端口：`993`
- 协议：IMAP
- SSL：开启

### 3. 代理池配置

系统支持 HTTP 和 SOCKS5 代理：

#### HTTP 代理
```
代理类型：HTTP
主机：proxy.example.com
端口：8080
用户名：username（可选）
密码：password（可选）
```

#### SOCKS5 代理
```
代理类型：SOCKS5
主机：socks5.example.com
端口：1080
用户名：username（可选）
密码：password（可选）
```

### 4. 卡密系统配置

#### 卡密功能特性
- **使用次数限制**：可设置单个卡密的使用次数
- **过期时间**：支持设置卡密有效期
- **邮箱绑定**：可将卡密绑定到特定邮箱账号
- **发件人过滤**：支持按发件人地址过滤邮件
- **时间过滤**：可设置获取最近N天的邮件

#### 卡密生成示例
```
卡密：MAIL2024ABC123
使用次数：10次
有效期：2024-12-31
绑定邮箱：user@example.com
发件人过滤：noreply@bank.com,service@company.com
```

## 🌐 Nginx 反向代理配置

```nginx
server {
    listen 80;
    server_name your-domain.com;

    location / {
        proxy_pass http://127.0.0.1:8005;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        
        # WebSocket 支持
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}

# SSL 配置（推荐）
server {
    listen 443 ssl http2;
    server_name your-domain.com;
    
    ssl_certificate /path/to/your/cert.pem;
    ssl_certificate_key /path/to/your/key.pem;
    
    location / {
        proxy_pass http://127.0.0.1:8005;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto https;
    }
}
```

## 📱 移动端适配

### 响应式设计特性
- ✅ **移动优先**：采用移动优先的响应式设计
- ✅ **触摸优化**：针对触摸操作优化的界面元素
- ✅ **自适应导航**：智能的移动端导航栏，支持手势操作
- ✅ **内容重排**：内容在不同屏幕尺寸下自动重新排列
- ✅ **性能优化**：移动端性能优化，快速加载

### 支持的屏幕尺寸
- **手机**：320px - 767px
- **平板**：768px - 1024px
- **桌面**：1025px+

### 移动端功能
- 侧滑导航菜单
- 手势关闭菜单
- 触摸友好的按钮和链接
- 优化的表单输入
- 快速访问常用功能

## 🔌 API 接口文档

### 邮件获取 API

#### 用户邮件获取
```http
POST /api/get_mail
Content-Type: application/json

{
    "email": "user@example.com",
    "card_key": "MAIL2024ABC123"
}
```

#### 管理员邮件获取
```http
POST /api/get_mail
Content-Type: application/json

{
    "email": "user@example.com",
    "admin_access": true
}
```

#### 响应格式
```json
{
    "success": true,
    "mail": {
        "subject": "邮件主题",
        "from": "发件人 <sender@example.com>",
        "to": "收件人 <user@example.com>",
        "date": "2024-01-01 12:00:00",
        "body": "邮件内容",
        "body_type": "html",
        "size": 1024,
        "images": [
            {
                "filename": "image.png",
                "content": "base64编码内容",
                "mime_type": "image/png",
                "size": 2048
            }
        ],
        "attachments": [
            {
                "filename": "document.pdf",
                "content": "base64编码内容",
                "mime_type": "application/pdf",
                "size": 4096
            }
        ]
    },
    "card_info": {
        "remaining_uses": 9,
        "total_uses": 10,
        "used_count": 1
    }
}
```

### 卡密 API

#### 生成卡密
```http
POST /admin/api/cards
Content-Type: application/json

{
    "action": "add",
    "card_key": "CUSTOM_KEY_123",
    "usage_limit": 10,
    "expired_at": "2024-12-31 23:59:59",
    "bound_email_id": null,
    "email_days_filter": 7,
    "sender_filter": "noreply@example.com",
    "remarks": "测试卡密"
}
```

#### 验证卡密
```http
GET /api/card/{card_key}
```

### 邮箱管理 API

#### 获取邮箱列表
```http
GET /admin/api/mailbox
```

#### 添加邮箱
```http
POST /admin/api/mailbox
Content-Type: application/json

{
    "action": "add",
    "email": "user@example.com",
    "username": "user@example.com",
    "password": "email_password_or_app_key",
    "server": "imap.example.com",
    "port": 993,
    "protocol": "imap",
    "ssl": true,
    "remarks": "测试邮箱"
}
```

## 🗄️ 数据库结构

### 核心数据表

#### mail_accounts（邮箱账号）
```sql
CREATE TABLE mail_accounts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    email TEXT NOT NULL UNIQUE,           -- 邮箱地址
    username TEXT NOT NULL,               -- 登录用户名
    password TEXT NOT NULL,               -- 密码或授权码
    server TEXT NOT NULL,                 -- 服务器地址
    port INTEGER NOT NULL,                -- 端口
    protocol TEXT NOT NULL DEFAULT 'imap', -- 协议类型
    ssl INTEGER NOT NULL DEFAULT 1,       -- 是否启用SSL
    remarks TEXT DEFAULT '',              -- 备注
    status INTEGER DEFAULT 1,             -- 状态
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

#### cards（卡密系统）
```sql
CREATE TABLE cards (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    card_key TEXT NOT NULL UNIQUE,        -- 卡密
    usage_limit INTEGER DEFAULT 1,        -- 使用次数限制
    used_count INTEGER DEFAULT 0,         -- 已使用次数
    expired_at DATETIME DEFAULT NULL,     -- 过期时间
    bound_email_id INTEGER DEFAULT NULL,  -- 绑定邮箱ID
    email_days_filter INTEGER DEFAULT 1,  -- 邮件天数过滤
    sender_filter TEXT DEFAULT '',        -- 发件人过滤
    status INTEGER DEFAULT 1,             -- 状态
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

#### proxy（代理池）
```sql
-- HTTP代理
CREATE TABLE http_proxies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,                   -- 代理名称
    host TEXT NOT NULL,                   -- 主机地址
    port INTEGER NOT NULL,                -- 端口
    username TEXT DEFAULT '',             -- 用户名
    password TEXT DEFAULT '',             -- 密码
    status INTEGER DEFAULT 1,             -- 状态
    response_time INTEGER DEFAULT 0,      -- 响应时间
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- SOCKS5代理
CREATE TABLE socks5_proxies (
    -- 结构与http_proxies相同
);
```

## 🔍 故障排除

### 常见问题及解决方案

#### 1. Python 依赖安装失败

**问题症状**：
```
ERROR: Could not find a version that satisfies the requirement flask>=3.0.0
```

**解决方法**：
```bash
# 更新 pip
pip install --upgrade pip

# 使用国内镜像源
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

# 系统包管理器安装（Ubuntu/Debian）
sudo apt update
sudo apt install python3-flask python3-flask-session
```

#### 2. 邮箱连接失败

**问题症状**：
```json
{
    "success": false,
    "message": "邮箱连接失败"
}
```

**常见原因及解决方法**：

1. **未开启IMAP/POP3服务**
   - 登录邮箱设置开启IMAP/POP3服务
   - QQ邮箱：设置 → 账户 → POP3/IMAP

2. **密码错误**
   - 使用授权码而不是登录密码
   - QQ邮箱需生成授权码
   - Gmail需要应用专用密码

3. **服务器配置错误**
   - 检查服务器地址和端口
   - 确认SSL设置是否正确

4. **防火墙/网络问题**
   - 检查防火墙设置
   - 确认网络连接正常

#### 3. 代理连接问题

**解决方法**：
```bash
# 测试代理连接
curl --proxy socks5://username:password@proxy.example.com:1080 https://www.google.com

# 验证代理配置
python3 -c "
import socks
import socket
socks.set_default_proxy(socks.SOCKS5, 'proxy.example.com', 1080)
socket.socket = socks.socksocket
print('代理测试成功')
"
```

#### 4. 数据库权限问题

**解决方法**：
```bash
# 确保数据库目录权限
chmod 755 db/
chmod 644 db/*.sqlite

# 确保应用有写权限
chown -R www-data:www-data /path/to/mail-915/  # 适用于 Apache/Nginx
```

#### 5. 移动端显示问题

**解决方法**：
- 清除浏览器缓存
- 检查viewport设置
- 确认CSS媒体查询正常加载

### 日志调试

#### 启用详细日志
```bash
# 设置日志级别
export FLASK_ENV=development
export FLASK_DEBUG=1

# 启动应用
python3 app.py
```

#### 查看日志文件
```bash
# 查看应用日志
tail -f logs/app.log

# 查看邮件处理日志
tail -f logs/mail_fetcher.log

# 查看Nginx日志
tail -f /var/log/nginx/access.log
tail -f /var/log/nginx/error.log
```

## 🔒 安全建议

### 部署安全
1. **修改默认密码**：首次部署后立即修改管理员密码
2. **使用HTTPS**：生产环境必须开启SSL证书
3. **防火墙配置**：仅开放必要端口（80, 443, 8005）
4. **定期备份**：定期备份数据库和配置文件
5. **更新依赖**：定期更新Python依赖包和系统

### 应用安全
1. **密码策略**：使用强密码和邮箱授权码
2. **访问控制**：配置IP白名单（如需要）
3. **会话安全**：合理设置会话超时时间
4. **输入验证**：系统已内置输入验证和XSS防护
5. **SQL注入防护**：使用参数化查询

### 数据安全
1. **数据加密**：敏感数据库字段加密存储
2. **定期清理**：清理过期日志和临时文件
3. **备份策略**：实施 3-2-1 备份策略
4. **访问日志**：启用详细的访问和操作日志

## 📈 性能优化

### 应用优化
```bash
# 使用生产WSGI服务器
pip install gunicorn
gunicorn -w 4 -b 0.0.0.0:8005 --worker-class sync app:app

# 启用缓存
pip install redis
# 配置Redis缓存
```

### 数据库优化
```sql
-- 定期优化SQLite
VACUUM;
ANALYZE;

-- MySQL优化
OPTIMIZE TABLE mail_accounts, cards, card_logs;

-- PostgreSQL优化
VACUUM ANALYZE;
```

### 系统优化
```bash
# 系统资源监控
htop
iotop
nethogs

# 调整系统参数
echo 'net.core.somaxconn = 1024' >> /etc/sysctl.conf
echo 'net.ipv4.tcp_max_syn_backlog = 1024' >> /etc/sysctl.conf
sysctl -p
```

## 🔄 更新日志

### 版本 2.0.0 (当前版本)
- ✅ **完全重写**：从PHP迁移到Python Flask
- ✅ **移动端优化**：修复移动端导航栏布局问题，优化响应式设计
- ✅ **多数据库支持**：新增MySQL和PostgreSQL支持
- ✅ **代理池增强**：改进代理管理和故障切换
- ✅ **卡密系统完善**：新增绑定邮箱、发件人过滤等高级功能
- ✅ **API接口扩展**：提供完整的RESTful API
- ✅ **安全性提升**：加强输入验证和SQL注入防护
- ✅ **性能优化**：优化邮件获取和数据库查询性能

### 版本 1.0.0 (PHP版本)
- 基础的IMAP/POP3邮件获取功能
- 简单的管理员后台
- SQLite数据库支持
- 基础的响应式界面

## 🤝 贡献指南

### 开发环境设置
```bash
# 克隆项目
git clone <repository-url>
cd mail-915

# 创建开发分支
git checkout -b feature/your-feature-name

# 安装开发依赖
pip install -r requirements.txt
pip install -r requirements-dev.txt  # 如果存在

# 启动开发服务器
export FLASK_ENV=development
export FLASK_DEBUG=1
python3 app.py
```

### 提交代码
```bash
# 提交前检查
python3 -m flake8 app.py
python3 -m pytest tests/  # 如果有测试

# 提交代码
git add .
git commit -m "feat: add new feature description"
git push origin feature/your-feature-name
```

## 📞 技术支持

### 问题反馈
如果遇到问题，请按以下步骤排查：

1. **查看文档**：首先查看本README和常见问题部分
2. **检查日志**：查看应用日志和错误信息
3. **环境检查**：确认Python版本、依赖包和数据库配置
4. **网络测试**：测试邮箱连接和代理设置
5. **提交Issue**：如果问题仍未解决，请提交详细的问题报告

### 系统状态检查
```bash
# 检查应用状态
curl http://localhost:8005/admin
curl http://localhost:8005/api/get_mail

# 检查数据库连接
python3 -c "
import sqlite3
conn = sqlite3.connect('db/mail.sqlite')
print('Database connection: OK')
conn.close()
"

# 检查邮件模块
python3 python/mail_fetcher.py --help
```

## 📄 许可证

本项目基于 MIT 许可证开源。详见 [LICENSE](LICENSE) 文件。

---

**注意**：这是基于 Python Flask 重构的全新版本，在保持与原PHP版本界面和功能完全一致的基础上，新增了移动端优化、多数据库支持、高级卡密系统等企业级功能。

**移动端优化**：新版本特别针对移动端浏览器进行了优化，解决了导航栏覆盖内容、布局不均匀等问题，提供了更好的移动端用户体验。