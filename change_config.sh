# Define the original file and the base name for the copies  
original_file="config.json"  # Change this to your actual file name  
base_name="config"  
db_path_base="./conf/bbolt_db"  

# Create 10 copies and modify the db_path  
for i in {1..15}; do  
    # Construct the new file name  
    new_file="${base_name}_${i}.json"

    # Copy the original file to the new file  
    cp "$original_file" "$new_file"  

    # Update the db_path in the new file  
    sed -i "s|\"prover_name\": \"test_on_solar2\"|\"prover_name\": \"cysnet_phase2_${i}\"|g" "$new_file"  
    sed -i "s|\"db_path\": \"$db_path_base*\"|\"db_path\": \"$db_path_base${i}\"|g" "$new_file"  
done  

echo "Copied and modified the file 15 times."
