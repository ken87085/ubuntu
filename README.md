# Ubuntu Apache 自動化部署項目

這個項目提供了在 Ubuntu 虛擬機中自動部署 Apache 網頁伺服器的完整解決方案，確保伺服器配置正確並可從宿主機訪問。

## 項目概述

本項目旨在通過自動化腳本在新建的 Ubuntu 虛擬機內部署並配置 Apache 伺服器，實現以下目標：

- 基礎 Apache 伺服器的安裝與配置
- 安全設置與優化
- 網絡配置，確保從實體機可訪問虛擬機中的網頁
- 完整的自動化部署流程，最小化人工干預

## 項目結構

```
├── README.md                 # 項目說明文檔
├── setup.sh                  # 主設置腳本
├── scripts/                  # 輔助腳本目錄
│   ├── install_apache.sh     # Apache 安裝腳本
│   ├── configure_apache.sh   # Apache 配置腳本
│   ├── setup_firewall.sh     # 防火牆設置腳本
│   └── network_config.sh     # 網絡配置腳本
├── configs/                  # 配置文件目錄
│   ├── apache/               # Apache 配置文件
│   │   ├── apache2.conf      # Apache 主配置文件
│   │   └── sites-available/  # 站點配置目錄
│   │       └── 000-default.conf  # 默認站點配置
└── web/                      # 網站文件目錄（示例）
    └── index.html            # 示例首頁
```

## 使用方法

### 前提條件

- 已安裝 Ubuntu 虛擬機（推薦 20.04 LTS 或更高版本）
- 虛擬機可接入網路
- 具有 sudo 權限的用戶帳號

### 在新 Ubuntu 虛擬機中部署

1. 首先更新系統並安裝 git：

```bash
sudo apt update
sudo apt install git -y
```

2. 克隆此倉庫：

```bash
git clone https://github.com/jcode0x378/ubuntu-apache-setup.git
```

3. 進入項目目錄並啟動安裝腳本：

```bash
cd ubuntu-apache-setup
chmod +x setup.sh
./setup.sh
```

4. 按照腳本提示完成配置

### 驗證部署

安裝完成後，可通過以下方式驗證部署是否成功：

1. 在虛擬機內部檢查 Apache 狀態：

```bash
sudo systemctl status apache2
```

2. 在實體機上通過瀏覽器訪問虛擬機 IP 地址：

```
http://[虛擬機IP地址]
```

## 故障排除

如果遇到問題，請嘗試以下步驟：

1. 檢查 Apache 服務狀態：
```bash
sudo systemctl status apache2
```

2. 檢查 Apache 錯誤日誌：
```bash
sudo tail -f /var/log/apache2/error.log
```

3. 驗證防火牆規則：
```bash
sudo ufw status
```

4. 確認網絡連接：
```bash
ip addr show
``` 