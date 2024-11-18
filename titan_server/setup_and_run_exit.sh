#  === CHECK PARAMS, ASSETS AND PROVER FILES ===
declare -A files=(
    # params
    ["/root/.scroll_prover/params/params20"]="54ef75911da76d7a6b7ea341998aaf66cb06c679c53e0a88a4fe070dd3add963 https://circuit-release.s3.us-west-2.amazonaws.com/setup/params20"
    ["/root/.scroll_prover/params/params24"]="f94fa4afa2f5147680f907d4dd96a8826206c26bd3328cd379feaed614b234de https://circuit-release.s3.us-west-2.amazonaws.com/setup/params24"
    ["/root/.scroll_prover/params/params25"]="dec49a69893fbcd66cd06296b2d936a6aceb431c130b2e52675fe4274b504f57 https://circuit-release.s3.us-west-2.amazonaws.com/setup/params25"
    # assets
    ["/root/.scroll_prover/assets/layer1.config"]="dc641fa235d2654e1c1e1e11d27a7b76cf672be1f723b5a0a931f278b24d96f9 https://circuit-release.s3.us-west-2.amazonaws.com/release-v0.13.1/layer1.config"
    ["/root/.scroll_prover/assets/layer2.config"]="fa75f6878faca890a4b95ac385b8ecc84c3f0ed1f3daf54a6d317e9698d2ebab https://circuit-release.s3.us-west-2.amazonaws.com/release-v0.13.1/layer2.config"
    ["/root/.scroll_prover/assets/layer3.config"]="30b9bf553fcb8e73ed653de4ce8543f4c730a3c4ee30901537bdf8f0b0d1653f https://circuit-release.s3.us-west-2.amazonaws.com/release-v0.13.1/layer3.config"
    ["/root/.scroll_prover/assets/layer4.config"]="24fa0bdad540e1c07c74f8e83221e101c415c490b56a008f5c0738fba6303cf3 https://circuit-release.s3.us-west-2.amazonaws.com/release-v0.13.1/layer4.config"
    ["/root/.scroll_prover/assets/vk_chunk.vkey"]="55c908f1adb48ad93fb21819b668a17b9fc9ed0ceced57e1068918008271c61b https://circuit-release.s3.us-west-2.amazonaws.com/release-v0.13.1/vk_chunk.vkey"
    ["/root/cysic-prover/prover"]="dbd3067960edc9162afb260c8322dd1a40cdc64024dc326b5ef4a3ba2637918d https://github.com/cysic-labs/phase2_libs/releases/download/v1.0.0/monitor_linux"
    ["/root/cysic-prover/libdarwin_prover.so"]="b3efdd0b67f36b966e3e40bda2c785721300c4897d800417bedb936d945462c5 https://github.com/cysic-labs/phase2_libs/releases/download/v1.0.0/libdarwin_prover.so"
    ["/root/cysic-prover/libzkp.so"]="7c13f5b2e444a566b473d82e050d20ed055e1d60cbc34ec6b2498d1deffaa087 https://github.com/cysic-labs/phase2_libs/releases/download/v1.0.0/libzkp.so"
    ["/root/cysic-prover/libcysnet_monitor.so"]="c520295094f616aaa9116b0763817b8577627aa1f9f92a3d057906fafe0fe895 https://github.com/cysic-labs/phase2_libs/releases/download/v1.0.0/libcysnet_monitor.so"
)

for file in "${!files[@]}"; do
    # Split the value into hash and URL
    file_info=(${files[$file]})
    expected_hash=${file_info[0]}
    download_url=${file_info[1]}

    if [[ ! -f "$file" ]]; then
        echo "❌ $file does not exist."
        exit 1
    else
        echo "Checking $file..."
        # Compute the SHA256 checksum of the file
        computed_hash=$(sha256sum "$file" | awk '{print $1}')

        if [[ "$computed_hash" == "$expected_hash" ]]; then
            echo "✔️ $file exists and the SHA256 checksum is correct."
        else
            echo "❌ $file exists, but the SHA256 checksum is incorrect!"
            echo "  Expected: $expected_hash"
            echo "  Got:      $computed_hash"
            exit 1
        fi
    fi
done
#  === CHECK PARAMS, ASSETS AND PROVER FILES ===

# === MODIFY CONFIG.YAML ===
cd /root/cysic-prover
sed -i "s/^claim_reward_address:.*$/claim_reward_address: \"$REWARD_ADDRESS\"/" config.yaml # REWARD_ADDRESS is set in Dockerfile ENV
# === MODIFY CONFIG.YAML ===

#  === START PROVER ===
# incase the cyscnet rpc error cause the prover to exit, we will keep retrying
LD_LIBRARY_PATH=. CHAIN_ID=534352 ./prover
# while true; do
#     LD_LIBRARY_PATH=. CHAIN_ID=534352 ./prover
#     if [ $? -ne 0 ]; then
#         echo "Prover failed, retrying in 10 seconds..."
#         sleep 10
#     fi
# done
#  === START PROVER ===
