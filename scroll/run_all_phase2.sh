# 15个prover without output
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_1.json  | grep "store_task_into_db: coordinator fetch_task is" > task.log &
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_2.json  | grep "store_task_into_db: coordinator fetch_task is" > task.log &
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_3.json  | grep "store_task_into_db: coordinator fetch_task is" > task.log &
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_4.json  | grep "store_task_into_db: coordinator fetch_task is" > task.log &
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_5.json  | grep "store_task_into_db: coordinator fetch_task is" > task.log &
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_6.json  | grep "store_task_into_db: coordinator fetch_task is" > task.log &
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_7.json  | grep "store_task_into_db: coordinator fetch_task is" > task.log &
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_8.json  | grep "store_task_into_db: coordinator fetch_task is" > task.log &
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_9.json  | grep "store_task_into_db: coordinator fetch_task is" > task.log &
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_10.json | grep "store_task_into_db: coordinator fetch_task is" > task.log &
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_11.json  | grep "store_task_into_db: coordinator fetch_task is" > task.log &
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_12.json  | grep "store_task_into_db: coordinator fetch_task is" > task.log &
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_13.json  | grep "store_task_into_db: coordinator fetch_task is" > task.log &
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_14.json  | grep "store_task_into_db: coordinator fetch_task is" > task.log &
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_15.json  | grep "store_task_into_db: coordinator fetch_task is" > task.log &
# 15个prover with output
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_1.json 
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_2.json 
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_3.json 
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_4.json 
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_5.json 
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_6.json 
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_7.json 
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_8.json 
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_9.json 
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_10.json
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_11.json 
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_12.json 
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_13.json 
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_14.json 
RUST_BACKTRACE=all RUST_LOG=off ./phase2_prover --config=./conf/config_15.json 