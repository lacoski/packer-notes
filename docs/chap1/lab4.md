## Step-by-Step Guide: Cloning an Ubuntu 22.04 VM with virt-manager

1.  **Open virt-manager:** Launch the virt-manager application.

2.  **Ensure VM is Shut Down:** In the virt-manager window, locate your Ubuntu 22.04 VM and ensure it is completely shut down. Right-click and select "Shut Down" if it's running.

3.  **Right-Click on the VM:** Right-click the name of your shut-down Ubuntu 22.04 VM in the list.

4.  **Select "Clone":** In the context menu, click "Clone".

5.  **Configure Clone Name:** In the "Clone Virtual Machine" dialog, enter a **new and unique name** for your cloned VM in the "Name:" field.

6.  **Customize Clone Settings (Optional but Recommended):**

    * **Storage:** Review the "Storage" section. Ensure the target path for the cloned disk is different from the original. Full clones are generally recommended for simplicity.
    * **MAC Address:** **Crucially**, ensure the "Generate a new MAC address" checkbox is selected.
    * **UUID:** Ensure the "Clone this virtual machine's UUID" checkbox is **unchecked** so a new UUID is generated.
    * **Review Other Options:** Check other customization options as needed.

7.  **Click "Clone":** Click the "Clone" button at the bottom of the dialog.

8.  **Wait for Cloning:** virt-manager will copy the VM configuration and disk image(s). This may take some time.

9.  **Verify Cloned VM:** The new VM will appear in the virt-manager list with the name you provided.

10. **Start and Configure the Cloned VM (If Necessary):**
    * **Network Configuration:** If the original VM had a static IP, you might need to change it in the clone to avoid conflicts. DHCP should obtain a new IP.
    * **Hostname:** It's good practice to change the hostname of the clone:
        ```bash
        sudo hostnamectl set-hostname new-clone-hostname
        ```
        Reboot might be required.

You now have a clone of your Ubuntu 22.04 VM. Remember to manage its network settings (MAC address, IP address, hostname) appropriately.

Video: https://youtu.be/HRnwl_t4eDo

# Reference:

https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/cloning-a-vm
