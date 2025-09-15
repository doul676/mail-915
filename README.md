# 邮件查看系统 (Python Flask 版)

一个基于 Python Flask 框架开发的现代化邮件查看系统，支持IMAP/POP3协议，提供完整的邮件管理和查看功能。

## 🌟 主要特性

- 🐍 **Python Flask 3.0+**：现代化的 Python Web 框架，易于维护和扩展
- 🌐 **现代化界面**：响应式设计，完美支持桌面端和移动端访问
- 📧 **多协议支持**：完整支持IMAP和POP3协议，可选择SSL安全连接
- 🔧 **完整管理后台**：功能齐全的管理员控制面板，支持所有管理操作
- 🌐 **代理池支持**：集成HTTP和SOCKS5代理池，支持代理连接和智能切换
- 🔑 **卡密系统**：完整的卡密生成、管理和使用系统
- 🗄️ **多数据库支持**：支持SQLite、MySQL、PostgreSQL多种数据库
- 🛡️ **安全性**：管理员登录验证，安全的会话管理
- 📱 **完美移动适配**：所有页面完美适配移动端，提供原生APP般的体验
- 🎨 **美观界面**：渐变背景、流畅动画、现代化UI设计

## 🏗️ 技术栈

- **后端**：Python 3.12+、Flask 3.1+、Werkzeug 3.1+
- **前端**：HTML5、CSS3、JavaScript (ES6+)、响应式设计
- **数据库**：SQLite3 (默认) / MySQL 8.0+ / PostgreSQL 12+
- **邮件处理**：IMAPClient 3.0+、内置邮件解析器
- **代理支持**：PySocks、内置代理池管理
- **会话管理**：Flask-Session、安全会话存储

## 📁 项目结构

```
邮件查看系统/
├── app.py                      # Flask 主应用文件
├── requirements.txt            # Python 依赖包
├── install.sh                  # 自动安装脚本
├── templates/                  # Jinja2 模板文件
│   ├── base.html              # 基础模板
│   ├── frontend/              # 前端用户界面
│   │   └── index.html         # 用户邮件查看页面
│   └── admin/                 # 后台管理界面
│       ├── login.html         # 管理员登录页面 
│       ├── home.html          # 管理员首页（✅ 移动端适配）
│       ├── mailbox.html       # 邮箱管理页面（✅ 移动端适配）
│       ├── daili.html         # 代理池管理页面（✅ 移动端适配）
│       ├── kami.html          # 卡密管理页面（✅ 移动端适配）
│       ├── kamirizhi.html     # 卡密日志页面（✅ 移动端适配）
│       ├── shoujian.html      # 收件日志页面（✅ 移动端适配）
│       └── system.html        # 系统设置页面（✅ 移动端适配）
├── python/                    # Python 邮件处理模块
│   ├── mail_fetcher.py        # 邮件获取器（支持代理）
│   └── requirements.txt       # 邮件模块依赖
├── db/                        # 数据库文件
│   ├── init.sql              # 数据库初始化脚本
│   ├── mail.sqlite           # 主数据库（自动创建）
│   └── admin.sqlite          # 管理员数据库（自动创建）
└── README.md                 # 项目说明文档
```

## 🚀 快速开始

### 环境要求

- **Python版本**：3.12 或以上
- **系统**：Linux/Windows/macOS
- **包管理**：pip 
- **Web服务器**：可选（Nginx + Gunicorn/uWSGI）

### 一键安装（推荐）

```bash
# 1. 克隆项目
git clone <repository-url>
cd mail-915

# 2. 运行安装脚本
chmod +x install.sh
./install.sh

# 3. 启动应用
python app.py
```

### 手动安装

```bash
# 1. 克隆项目
git clone <repository-url>
cd mail-915

# 2. 安装Python依赖
pip install -r requirements.txt

# 3. 启动应用（会自动初始化数据库）
python app.py
```

### 访问系统

- **前端用户界面**：http://localhost:8005
- **管理员后台**：http://localhost:8005/admin
- **默认管理员账号**：用户名 `admin`，密码 `admin`

> ⚠️ **安全提醒**：首次登录后请立即修改默认密码！

## 📱 移动端支持

本系统已完美适配移动端，所有管理页面均支持：

- ✅ **响应式布局**：自动适配不同屏幕尺寸
- ✅ **移动端导航**：侧边栏菜单，支持手势操作
- ✅ **触摸优化**：按钮和交互元素适配触摸操作
- ✅ **流畅动画**：原生般的页面切换效果

### 移动端操作指南

1. **打开菜单**：点击页面左上角的 ☰ 按钮
2. **导航页面**：在打开的侧边栏中选择功能页面
3. **关闭菜单**：点击页面任意空白区域或导航到新页面

## 🔧 功能模块

### 1. 邮箱管理
- 📫 **IMAP/POP3配置**：支持主流邮箱服务商
- 🔐 **安全连接**：SSL/TLS加密支持
- 📊 **连接测试**：实时测试邮箱连接状态
- 📝 **批量导入**：支持批量添加邮箱账号

### 2. 代理池管理
- 🌐 **多协议支持**：HTTP、SOCKS5代理
- ⚡ **智能切换**：自动选择最优代理
- 📊 **状态监控**：实时监控代理可用性
- 🔄 **故障切换**：自动故障切换和负载均衡

### 3. 卡密系统
- 🔑 **卡密生成**：单个或批量生成访问卡密
- 📊 **使用统计**：详细的使用记录和统计
- 🗂️ **回收站**：已删除卡密的恢复功能
- ⏰ **过期管理**：自动处理过期卡密

### 4. 日志系统
- 📝 **操作日志**：完整记录所有操作
- 📧 **邮件日志**：邮件获取记录和统计
- 🔍 **查询过滤**：支持多条件查询和筛选

### 5. 系统设置
- 👤 **账号管理**：管理员账号安全设置
- 🎨 **界面定制**：页面标题和样式配置
- 🔧 **系统配置**：核心参数和功能设置

## 🗄️ 数据库支持

### SQLite（默认）
```bash
# 无需额外配置，自动创建数据库文件
python app.py
```

### MySQL
```bash
# 设置环境变量
export DATABASE_TYPE=mysql
export MYSQL_HOST=localhost
export MYSQL_USER=root
export MYSQL_PASSWORD=your_password
export MYSQL_DATABASE=mail_system

# 启动应用
python app.py
```

### PostgreSQL
```bash
# 设置环境变量
export DATABASE_TYPE=postgresql
export POSTGRES_HOST=localhost
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=your_password
export POSTGRES_DATABASE=mail_system

# 启动应用
python app.py
```

## 🌐 生产环境部署

### 使用 Gunicorn（推荐）

```bash
# 安装 Gunicorn
pip install gunicorn

# 启动服务（4个工作进程）
gunicorn -w 4 -b 0.0.0.0:8005 app:app

# 后台运行
nohup gunicorn -w 4 -b 0.0.0.0:8005 app:app > gunicorn.log 2>&1 &
```

### 使用 uWSGI

```bash
# 安装 uWSGI
pip install uwsgi

# 启动服务
uwsgi --http :8005 --wsgi-file app.py --callable app --processes 4

# 使用配置文件
uwsgi --ini uwsgi.ini
```

### Nginx 反向代理配置

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
        
        # 移动端优化
        proxy_set_header X-Forwarded-Host $server_name;
        proxy_redirect off;
    }
    
    # 静态文件缓存
    location /static/ {
        expires 30d;
        add_header Cache-Control "public, immutable";
    }
}
```

## 📧 邮箱配置参考

### 常用邮箱服务商配置

#### QQ邮箱（推荐）
```
服务器：imap.qq.com
端口：993
协议：IMAP
SSL：开启
密码：授权码（非QQ密码）
```

#### 163邮箱
```
服务器：imap.163.com
端口：993
协议：IMAP  
SSL：开启
密码：授权码
```

#### Gmail
```
服务器：imap.gmail.com
端口：993
协议：IMAP
SSL：开启
密码：应用专用密码
```

#### Outlook/Hotmail
```
服务器：outlook.office365.com
端口：993
协议：IMAP
SSL：开启
密码：账号密码或应用密码
```

### 获取邮箱授权码步骤

1. **QQ邮箱**：设置 → 账户 → 开启IMAP服务 → 生成授权码
2. **163邮箱**：设置 → POP3/IMAP → 开启IMAP服务 → 设置客户端授权码
3. **Gmail**：Google账户 → 安全性 → 2步验证 → 应用专用密码

## 🔧 API 接口

### 邮件获取 API
```http
POST /api/get_mail
Content-Type: application/json

{
    "email": "user@example.com",
    "card_key": "your_card_key"
}
```

### 管理员 API
```http
# 邮箱管理
GET /admin/api/mailbox
POST /admin/api/mailbox
DELETE /admin/api/mailbox

# 代理管理
GET /admin/api/proxy
POST /admin/api/proxy
DELETE /admin/api/proxy

# 卡密管理
GET /admin/api/cards
POST /admin/api/cards
DELETE /admin/api/cards
```

## 🐛 故障排除

### 常见问题及解决方案

#### 1. Python 依赖安装失败
```bash
# 更新 pip
pip install --upgrade pip

# 使用清华源
pip install -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

# Ubuntu/Debian 系统包
sudo apt install python3-dev python3-pip
```

#### 2. 邮箱连接失败
**检查项目**：
- ✅ 确认已开启IMAP/POP3服务
- ✅ 使用授权码而非登录密码
- ✅ 验证服务器地址和端口
- ✅ 检查SSL设置
- ✅ 确认防火墙不阻止连接

#### 3. 移动端显示异常
**解决方法**：
- ✅ 清除浏览器缓存
- ✅ 检查网络连接
- ✅ 更新浏览器版本
- ✅ 确认JavaScript已启用

#### 4. 数据库连接问题
```bash
# SQLite权限问题
chmod 755 db/
chmod 644 db/*.sqlite

# MySQL连接问题
mysql -u root -p -e "CREATE DATABASE mail_system;"
mysql -u root -p -e "GRANT ALL ON mail_system.* TO 'user'@'localhost';"
```

## 🔒 安全建议

### 生产环境安全配置

1. **立即修改默认密码**
2. **使用HTTPS**：配置SSL证书
3. **定期备份数据库**：备份 `db/` 目录
4. **配置防火墙**：仅开放必要端口
5. **使用专用授权码**：避免使用邮箱登录密码
6. **定期更新依赖**：保持软件包最新
7. **监控日志**：定期检查系统日志

### 推荐的安全措施

```bash
# 1. 设置合适的文件权限
chmod 700 db/
chmod 600 db/*.sqlite

# 2. 配置环境变量而不是硬编码
export SECRET_KEY="your-random-secret-key"
export DATABASE_URL="your-database-url"

# 3. 使用进程管理器
pip install supervisor
```

## 📈 更新日志

### 版本 2.1.0 (移动端完美适配版)
- ✅ **完美移动端适配**：所有管理页面支持移动端
- ✅ **响应式导航**：移动端侧边栏菜单
- ✅ **触摸优化**：按钮和交互适配触摸操作
- ✅ **性能优化**：页面加载和交互性能提升
- ✅ **UI/UX改进**：更现代化的界面设计

### 版本 2.0.0 (Python Flask 重构版)
- 🔄 **完全重构**：从PHP迁移到Python Flask
- 🆕 **新增功能**：代理池、卡密系统、多数据库支持
- 🎨 **界面升级**：现代化响应式设计
- 🚀 **性能提升**：更快的响应速度和更好的稳定性

### 版本 1.0.0 (PHP 原版)
- 📧 **基础功能**：IMAP/POP3邮件获取
- 🔧 **管理后台**：基础的邮箱管理
- 📱 **响应式设计**：基础的移动端支持

## 🤝 技术支持

### 获取帮助

遇到问题时，请按以下顺序检查：

1. **查看日志**：检查应用和系统日志
2. **验证配置**：确认邮箱和代理设置
3. **测试连接**：使用内置测试功能
4. **检查网络**：确认网络连接正常
5. **更新软件**：保持依赖包最新

### 常用诊断命令

```bash
# 检查Python环境
python --version
pip list | grep -E "(flask|imapclient)"

# 检查数据库
sqlite3 db/mail.sqlite ".tables"

# 检查端口占用
netstat -tlnp | grep 8005

# 查看应用日志
tail -f gunicorn.log
```

## 📄 许可证

本项目基于 MIT 许可证开源，可自由使用和修改。

---

**邮件查看系统 v2.1.0** - 现代化邮件管理解决方案，完美支持桌面端和移动端。