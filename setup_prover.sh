#!/bin/bash

# 检查是否传入了参数
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <claim_reward_address>"
    exit 1
fi

CLAIM_REWARD_ADDRESS=$1

# 第一段命令：删除旧的cysic-prover目录，创建新的目录，并下载必要的文件
rm -rf ~/cysic-prover2
cd ~
mkdir cysic-prover2
curl -L https://github.com/cysic-labs/phase2_libs/releases/download/v1.0.0/monitor_linux > ~/cysic-prover2/prover
curl -L https://github.com/cysic-labs/phase2_libs/releases/download/v1.0.0/libdarwin_prover.so  > ~/cysic-prover2/libdarwin_prover.so
curl -L https://github.com/cysic-labs/phase2_libs/releases/download/v1.0.0/libzkp.so  > ~/cysic-prover2/libzkp.so
curl -L https://github.com/cysic-labs/phase2_libs/releases/download/v1.0.0/libcysnet_monitor.so  > ~/cysic-prover2/libcysnet_monitor.so

# 第二段命令：创建配置文件
cat <<EOF > ~/cysic-prover2/config.yaml
# Not Change
chain:
  # Not Change
  # endpoint: "node-pre.prover.xyz:80"
  endpoint: "grpc-testnet.prover.xyz:80"
  # Not Change
  chain_id: "cysicmint_9001-1"
  # Not Change
  gas_coin: "CYS"
  # Not Change
  gas_price: 10
  # Modify Here：! Your Address (EVM) submitted to claim rewards

######################
#   chain  setting   #
######################
asset_path: ~/.cysic/assets
claim_reward_address: "$CLAIM_REWARD_ADDRESS"

server:
  # don't modify this
  # cysic_endpoint: "https://api-pre.prover.xyz"
  cysic_endpoint: "https://api-testnet.prover.xyz"
EOF

# 第三段命令：设置执行权限并启动verifier
cd ~/cysic-prover2/
chmod +x ~/cysic-prover2/prover
echo "LD_LIBRARY_PATH=. CHAIN_ID=534352 ./prover" > ~/cysic-prover2/start.sh
chmod +x ~/cysic-prover2/start.sh

echo "Cysic prover setup is complete. Run ./start.sh to start the prover."
