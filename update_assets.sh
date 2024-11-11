# updateCysnet.yml
- name: params and assets
  hosts: all
  tasks:
    - name: Create .scroll_prover/v1 directory if it doesn't exist
      file:
        path: ~/.scroll_prover/v1
        state: directory
        mode: '0755'
        force: no

    - name: Copy params
      command: cp -r /home/cysic/scroll/volume/params ~/.scroll_prover/v1/params

    - name: Copy assets
      command: cp -r /home/cysic/scroll/volume/assets_darwinv2 ~/.scroll_prover/v1/assets
