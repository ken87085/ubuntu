#!/bin/bash
# 網絡配置腳本

echo "==== 開始配置網絡設置 ===="

# 獲取網絡介面信息
echo "獲取網絡介面信息..."
INTERFACES=$(ip -o link show | awk -F': ' '{print $2}' | grep -v "lo")
IP_ADDRESS=$(hostname -I | awk '{print $1}')

echo "檢測到的網絡介面："
echo "$INTERFACES"
echo "當前 IP 地址: $IP_ADDRESS"

# 檢查網絡連接
echo "檢查網絡連接..."
if ping -c 3 8.8.8.8 &> /dev/null; then
    echo "網絡連接正常，可訪問外部網絡"
else
    echo "警告：外部網絡連接可能有問題，但會繼續進行安裝"
fi

# 檢查本地連接
echo "檢查本地網絡設置..."
if [ -z "$IP_ADDRESS" ]; then
    echo "警告：未檢測到本地 IP 地址"
    IP_ADDRESS="127.0.0.1"
    echo "使用本地回環地址：$IP_ADDRESS"
else
    echo "本地 IP 地址設置正確：$IP_ADDRESS"
fi

# 顯示網絡設置建議
echo "網絡設置建議："
echo "- 確保虛擬機網絡設置為橋接模式或 NAT 模式以允許從宿主機訪問"
echo "- 如果使用 VirtualBox，建議設置為橋接網卡模式"
echo "- 如果使用 VMware，建議使用 NAT 或橋接模式"

# 顯示訪問信息
echo "網站訪問信息："
echo "從宿主機可通過以下地址訪問網站："
echo "http://$IP_ADDRESS"
echo "https://$IP_ADDRESS（如果啟用了 SSL）"

echo "==== 網絡配置完成 ===="
exit 0 