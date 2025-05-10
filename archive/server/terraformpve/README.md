
# cloud-init template config
Following settings should be adjusted to your needs.
Eg. I have my k3s machines utilizing vmbr911 on the hosts and VLAN24 with images on Ceph storage

    #!/bin/bash
    # Export ENV variables
    export MEMORY="2048"
    export NIC="vmbr911"
    export SSH_KEY="ed25519-cloud-init.pub"
    export STORAGE="zfs500blue"
    export VM_ID="9000"
    export VM_NAME="pve-ubuntu-cloudimg"
    export UBUNTU_VERSION="focal"

    # Install libguestfs-tools on Proxmox server IF NEEDED.
    #apt-get install libguestfs-tools

    # Pull down latest Ubuntu cloud-init image
    wget https://cloud-images.ubuntu.com/${UBUNTU_VERSION}/current/${UBUNTU_VERSION}-server-cloudimg-amd64.img


    # Install qemu-guest-agent on Ubuntu image.
    virt-customize -a ${UBUNTU_VERSION}-server-cloudimg-amd64.img --install qemu-guest-agent
    
    # Create VM
    qm create $VM_ID --name $VM_NAME --memory $MEMORY -net0 virtio,bridge=$NIC
    
    # Import disk
    qm importdisk --format qcow2 $VM_ID ${UBUNTU_VERSION}-server-cloudimg-amd64.img $STORAGE 
 
    # Set imported image as scsi0
    qm set $VM_ID --scsihw virtio-scsi-pci --scsi0 $STORAGE:vm-$VM_ID-disk-0
   
    ## NFS storage may require
    #qm set $VM_ID --scsihw virtio-scsi-pci --scsi0 $STORAGE:$VM_ID/vm-$VM_ID-disk-0.qcow2
    
    # Add cloud-init disk**
    qm set $VM_ID --ide2 $STORAGE:cloudinit
    
    # Set scsi0 as boot disk**
    qm set $VM_ID --boot c --bootdisk scsi0

    # Set host CPU type and add AES hardware acceleration flag**
    qm set $VM_ID --cpu host,flags=+aes

    # Add serial device for cloud-init
    qm set $VM_ID --serial0 socket

    # Enable qemu-guest-agent
    qm set $VM_ID --agent enabled=1,fstrim_cloned_disks=1

    # Copy SSH key
    #qm set $VM_ID --sshkey ~/.ssh/$SSH_KEY

    # Set local user (no password - SSH key will be used for login)
    #qm set $VM_ID --ciuser $USER
    
    # Convert to template
    qm template $VM_ID

# If this template utilizes shared storage, it should be able to be cloned from node to node without issue.

# If this template is on local storage, clone this image to relevant nodes and prepend with Proxmox hostname. The Terraform playbook will also need to be modified to target the local template when creating k3s nodes.
