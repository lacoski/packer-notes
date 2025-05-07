# Create VM with virt-manager

## Step-by-Step Guide: Creating an Ubuntu 22.04 VM with virt-manager (KVM)

* **Ubuntu 22.04 ISO Image:** Download from the official Ubuntu website.

**Steps:**

1.  **Launch virt-manager:** Open the application.

2.  **Create a New Virtual Machine:** Click the "Create a new virtual machine" button (+ icon).

3.  **Choose Installation Method:** Select "Local install media (ISO image or CDROM)" and click "Forward".

4.  **Locate the ISO Image:**
    * Click "Browse...".
    * Navigate to and select the Ubuntu 22.04 ISO file.
    * Verify or set OS Type to "Linux" and Version to "Ubuntu 22.04 LTS".
    * Click "Forward".

5.  **Configure Memory and CPUs:**
    * **Memory (RAM):** Enter the desired RAM (e.g., 2048 MB).
    * **CPUs:** Enter the number of virtual CPUs (e.g., 2).
    * Click "Forward".

6.  **Create a Virtual Disk:**
    * Select "Create a virtual disk".
    * **Size:** Enter the desired disk size (e.g., 25 GB).
    * Choose storage options as needed (single file, allocate now).
    * Click "Forward".

7.  **Name the Virtual Machine:** Enter a descriptive name.

8.  **Network Configuration (Optional):**
    * Choose "Virtual network 'default': NAT" for basic internet.
    * Alternatively, select a bridge device if configured.

9.  **Review and Begin Installation:**
    * Review the configuration summary.
    * Ensure "Customize configuration before install" is **unchecked** for a standard install.
    * Click "Finish".

10. **Ubuntu Installation:**
    * A VM console window will open.
    * Follow the Ubuntu installer prompts.

11. **First Boot:**
    * The VM will reboot after installation.
    * virt-manager usually handles removing the ISO. If not, manually remove the CDROM device from the VM's hardware settings.

12. **Install Guest Agents (Recommended):**
    ```bash
    sudo apt update
    sudo apt install qemu-guest-agent
    sudo systemctl enable qemu-guest-agent.service
    sudo systemctl start qemu-guest-agent.service
    ```

You have now created and installed Ubuntu 22.04 in a KVM virtual machine using virt-manager.

Video: https://youtu.be/2-BS0w1Sjvs

# Management VM with virt-manager

## virt-manager Actions: Turn On, Turn Off, Edit Config

### Turning On a Virtual Machine

1.  **Open virt-manager.**
2.  **Select the VM:** Locate your Ubuntu 22.04 VM in the list.
3.  **Power On:**
    * **Button:** Click the green "Play" button (right-pointing triangle) in the toolbar.
    * **Right-Click:** Right-click the VM name and select "Start".

### Turning Off a Virtual Machine

1.  **Select the VM:** Select your running Ubuntu 22.04 VM.
2.  **Shut Down (Graceful - Recommended):**
    * **Menu (VM Console):** In the VM's console, click "Virtual Machine" -> "Shutdown...". Choose an option and click "OK".
    * **Button (VM Console):** Click the "Power Off" button (power symbol) in the VM's console toolbar. Choose an option.
3.  **Force Off (Use with Caution):**
    * **Button (Main virt-manager):** Select the VM and click the red "Stop" button (square) in the toolbar.
    * **Right-Click (Main virt-manager):** Right-click the VM name and select "Force Off".

### Editing the Virtual Machine Configuration

1.  **Open virt-manager.**
2.  **Select the VM:** Select your Ubuntu 22.04 VM.
3.  **Open Virtual Machine Details:**
    * **Button:** Click the "Open" button ("i" in a circle) in the toolbar.
    * **Right-Click:** Right-click the VM name and select "Open".
4.  **Edit Configuration:** In the "Virtual Machine Details" window, select a category on the left to edit its properties on the right (e.g., CPU, Memory, Disk, Network).
5.  **Apply Changes:** Click the "Apply" button at the bottom.
6.  **Restart VM (If Necessary):** Some changes require a VM restart.

# Reference:

https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-creating_guests_with_virt_manager#sect-Installing_a_Red_Hat_Enterprise_Linux_7_guest_virtual_machine_on_a_Red_Hat_Enterprise_Linux_7_host-Creating_a_Red_Hat_Enterprise_Linux_7_guest_with_local_installation_media