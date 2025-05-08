# README

---

## Disable apparmor

```
sudo systemctl stop apparmor
sudo systemctl disable apparmor
```

## 📦 Install Required Package

Before deploying infrastructure, install the `genisoimage` package.

```bash
sudo apt install genisoimage -y
```

- `-y` automatically confirms the installation prompt.

---

## 📁 Initialize Terraform

```bash
terraform init
```

- Initializes the Terraform working directory.
- Downloads the required provider plugins.
- Prepares backend settings if configured.

---

## 📊 Review the Terraform Execution Plan

```bash
terraform plan
```

- Displays the resources to be created, updated, or destroyed.
- Useful for verifying changes before applying them.

---

## 🚀 Apply the Terraform Configuration

```bash
terraform apply
```

- Prompts for confirmation before proceeding.
- To skip the prompt, you can use:

  ```bash
  terraform apply -auto-approve
  ```

---