#!/bin/bash
# 主設置腳本

echo "開始安裝 Apache 伺服器環境..."

# 檢查是否以 root 權限運行
if [ "$(id -u)" -ne 0 ]; then
    echo "請以 sudo 或 root 權限運行此腳本"
    exit 1
fi

# 運行 Apache 安裝腳本
echo "執行 Apache 安裝..."
bash ./scripts/install_apache.sh
if [ $? -ne 0 ]; then
    echo "Apache 安裝失敗，請查看錯誤信息"
    exit 1
fi

# 配置 Apache
echo "配置 Apache..."
bash ./scripts/configure_apache.sh
if [ $? -ne 0 ]; then
    echo "Apache 配置失敗，請查看錯誤信息"
    exit 1
fi

# 設置防火牆
echo "設置防火牆..."
bash ./scripts/setup_firewall.sh
if [ $? -ne 0 ]; then
    echo "防火牆設置失敗，請查看錯誤信息"
    exit 1
fi

# 配置網絡
echo "配置網絡..."
bash ./scripts/network_config.sh
if [ $? -ne 0 ]; then
    echo "網絡配置失敗，請查看錯誤信息"
    exit 1
fi

# 顯示完成信息
IP_ADDRESS=$(hostname -I | awk '{print $1}')
echo "==================================================="
echo "安裝完成！Apache 伺服器已成功配置。"
echo "可以通過以下網址訪問網站："
echo "http://${IP_ADDRESS}"
echo "==================================================="
echo "如需檢查 Apache 服務狀態，請運行: sudo systemctl status apache2"
echo "如需查看 Apache 錯誤日誌，請運行: sudo tail -f /var/log/apache2/error.log" 