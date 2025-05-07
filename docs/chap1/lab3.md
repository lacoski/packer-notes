## Ubuntu 22.04 Configuration Tutorial

This tutorial guides you through configuring UFW, adding an SSH banner, and installing a basic Nginx webpage on your Ubuntu 22.04 virtual machine.

### Step 1: Configure UFW (Uncomplicated Firewall)

1.  **Open a Terminal** in your Ubuntu 22.04 VM.

2.  **Enable UFW:**
    ```bash
    sudo ufw enable
    ```

3.  **Allow SSH (Port 22):**
    ```bash
    sudo ufw allow 22
    # or
    sudo ufw allow 22/tcp
    ```

4.  **Allow HTTP (Port 80):**
    ```bash
    sudo ufw allow 80
    # or
    sudo ufw allow 80/tcp
    ```

5.  **Verify UFW Status:**
    ```bash
    sudo ufw status verbose
    ```
    Expected output should show ports 22 and 80 as allowed.

### Step 2: Add SSH Banner

1.  **Edit SSH Configuration File:**
    ```bash
    sudo nano /etc/ssh/sshd_config
    ```

2.  **Uncomment and Modify `Banner`:** Find the line `#Banner /etc/issue.net`, remove the `#`, and change the path:
    ```
    Banner /etc/ssh_banner
    ```
    Save and exit the editor.

3.  **Create Banner File:**
    ```bash
    sudo nano /etc/ssh_banner
    ```
    Add your banner message:
    ```
    Welcome to secure system
    ```
    Save and exit the editor.

4.  **Set Banner File Permissions:**
    ```bash
    sudo chmod 644 /etc/ssh_banner
    ```

5.  **Restart SSH Service:**
    ```bash
    sudo systemctl restart sshd
    ```

6.  **Verify Banner:** Connect to your VM via SSH from another machine; the banner should appear before the password prompt.

### Step 3: Install Nginx and Add a Webpage

1.  **Update Package Lists:**
    ```bash
    sudo apt update
    ```

2.  **Install Nginx:**
    ```bash
    sudo apt install nginx
    ```

3.  **Verify Nginx Status:**
    ```bash
    sudo systemctl status nginx
    ```
    Start and enable if needed:
    ```bash
    sudo systemctl start nginx
    sudo systemctl enable nginx
    ```

4.  **Create Custom Webpage:**
    ```bash
    sudo nano /var/www/html/index.html
    ```
    Add the following content:
    ```html
    <!DOCTYPE html>
    <html>
    <head>
        <title>My Webpage</title>
    </head>
    <body>
        <h1>This is application web</h1>
    </body>
    </html>
    ```
    Save and exit the editor.

5.  **Access Webpage:** Open a browser on your host machine and navigate to the IP address of your Ubuntu VM (find it using `ip a` or `hostname -I` in the VM). You should see "This is application web".


Video: https://youtu.be/x-WLrEC2KE0