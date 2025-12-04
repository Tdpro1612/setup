# --- 1. Phần Kiểm tra Docker ---
echo "--------- 🟢 Checking Docker installation -----------"

# Kiểm tra xem Docker có chạy được không
if command -v docker &> /dev/null
then
    echo "--------- ✅ Docker is already installed. Skipping installation. -----------"
else
    echo "--------- ❌ Docker is not installed. Running installation script. -----------"
    # Gọi script cài đặt Docker riêng
    wget https://raw.githubusercontent.com/Tdpro1612/setup/refs/heads/main/install_docker.sh -O install_docker.sh
    chmod +x install_docker.sh
    ./install_docker.sh
fi


echo "--------- 🟢 Start creating folder -----------"
# cd ~
# mkdir vol_n8n
# sudo chown -R 1000:1000 vol_n8n
# sudo chmod -R 755 vol_n8n
mkdir ./vol_n8n
sudo chown -R 1000:1000 ./vol_n8n
sudo chmod -R 755 ./vol_n8n
echo "--------- 🔴 Finish creating folder -----------"


echo "--------- 🟢 Start docker compose up  -----------"
wget https://raw.githubusercontent.com/Tdpro1612/setup/refs/heads/main/n8n_compose/docker-compose.yml -O compose.yaml
export EXTERNAL_IP=http://"$(hostname -I | cut -f1 -d' ')"
export CURR_DIR=$(pwd)
sudo -E docker compose up -d
echo "--------- 🔴 Finish! Wait a few minutes and test in browser at url $EXTERNAL_IP for n8n UI -----------"