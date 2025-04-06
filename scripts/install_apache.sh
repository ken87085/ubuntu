#!/bin/bash
# Apache 安裝腳本

# 顯示當前步驟
echo "==== 開始 Apache 安裝 ===="

# 更新系統套件列表
echo "更新系統套件列表..."
apt update

# 安裝 Apache2
echo "安裝 Apache2..."
apt install apache2 -y

# 檢查安裝是否成功
if [ $? -ne 0 ]; then
    echo "Apache2 安裝失敗"
    exit 1
fi

# 啟動 Apache 服務
echo "啟動 Apache 服務..."
systemctl start apache2
systemctl enable apache2

# 檢查服務是否正在運行
if ! systemctl is-active apache2 >/dev/null; then
    echo "Apache2 服務啟動失敗"
    exit 1
fi

# 安裝額外的軟體套件
echo "安裝 Apache 相關套件..."
apt install -y apache2-utils ssl-cert

echo "==== Apache 安裝完成 ===="
exit 0 