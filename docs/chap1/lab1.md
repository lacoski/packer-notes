# 📄 Packer Installation Guide on Ubuntu 22.04

Packer is a tool by HashiCorp used to create virtual machine or container images. This guide will help you install Packer on Ubuntu 22.04 via HashiCorp’s official repository.

---

## 📦 Install Required Packages

Before deploying infrastructure, install the following essential packages:

```bash
sudo apt install genisoimage -y
sudo apt install qemu-kvm bridge-utils virt-manager -y
sudo apt-get install mkisofs -y
```

- `genisoimage` is used for generating ISO images (for example, when working with cloud-init).
- `qemu-kvm`, `bridge-utils`, and `virt-manager` are useful for managing virtual machines locally.
- `mkisofs` provides ISO 9660 filesystem creation utilities.
- `-y` automatically confirms the installation prompt.



## 📦 Installation Steps

### Step 1️⃣: Add HashiCorp’s GPG Key

```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```

> **Note:** This command adds HashiCorp’s authentication key to your system.

---

### Step 2️⃣: Add the HashiCorp Repository

```bash
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```

> **Note:** The `lsb_release -cs` command automatically retrieves your current Ubuntu codename (e.g., `jammy` for 22.04).

---

### Step 3️⃣: Update Package List and Install Packer

```bash
sudo apt-get update && sudo apt-get install packer
```

---

### Step 4️⃣: Verify Packer Version

```bash
packer version
```

> **Expected output:**  
> ```bash
> Packer v1.11.0
> ```

---

## 📌 Notes

- This installation method uses `apt-key` — starting from Ubuntu 22.04, this command is deprecated.
- For a more secure and best practice approach, you can refer to the alternative method using `gpg --dearmor` [here](https://developer.hashicorp.com/packer/install).

---

## ✅ Done!

You’ve successfully installed Packer on Ubuntu 22.04 and are ready to use it with the `packer build` command.
