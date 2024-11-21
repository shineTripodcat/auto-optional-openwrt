#!/bin/sh

# 安装必要的软件包
pkg install -y unzip wget

echo "开始安装爱影CMS最新版本"
rm -f iycms.zip
wget --no-check-certificate "https://www.iycms.com/api/v1/download/cms/latest?os=1&kind=x86_64" -O iycms.zip

echo "解压文件"
unzip -o -q iycms.zip -d /home/iycms
rm -f iycms.zip

echo "开始安装系统服务"

# 创建服务脚本
cat <<EOF > /usr/local/etc/rc.d/iycms
#!/bin/sh

# PROVIDE: iycms
# REQUIRE: LOGIN
# KEYWORD: shutdown

. /etc/rc.subr

name=iycms
rcvar=iycms_enable
command=/home/iycms/cms
pidfile=/var/run/\$name.pid

load_rc_config \$name

: \${iycms_enable:=no}

run_rc_command \$1
EOF

chmod +x /usr/local/etc/rc.d/iycms

# 启用和启动服务
sysrc iycms_enable=YES
service iycms start

# 处理防火墙（根据需要进行调整）
# 这里可以添加相应的防火墙配置命令

echo "安装完成"
