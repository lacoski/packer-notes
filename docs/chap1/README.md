# Hướng Dẫn Cài Đặt Packer Trên Ubuntu 22.04

Packer là công cụ của HashiCorp dùng để tạo các image máy ảo hoặc container. Hướng dẫn này sẽ giúc bạn cài đặt Packer trên Ubuntu 22.04 thông qua repository chính thức của HashiCorp.

---

## 📦 Các Bước Cài Đặt

### Bước 1️⃣: Thêm GPG Key của HashiCorp

```bash
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```

> **Ghi chú:** Lệnh này giúp thêm khoá xác thực của HashiCorp vào hệ thống.

---

### Bước 2️⃣: Thêm Repository của HashiCorp

```bash
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```

> **Ghi chú:** Dùng `lsb_release -cs` để tự động lấy tên mã phiên bản Ubuntu hiện tại (vd: `jammy` cho 22.04).

---

### Bước 3️⃣: Cập Nhật Danh Sách Gói và Cài Đặt Packer

```bash
sudo apt-get update && sudo apt-get install packer
```

---

### Bước 4️⃣: Kiểm Tra Phiên Bản Packer

```bash
packer version
```

> **Kết quả mong đợi:**  
> ```bash
> Packer v1.11.0
> ```

---

## 📌 Lưu Ý

- Cách cài đặt này sử dụng `apt-key` — từ Ubuntu 22.04 trở đi, lệnh này đã bị deprecated.  
- Để bảo mật và chuẩn best practice hơn, bạn có thể tham khảo phương án thay thế với `gpg --dearmor` [tại đây](https://developer.hashicorp.com/packer/install).

---

## ✅ Hoàn Tất!

Bạn đã cài đặt thành công Packer trên Ubuntu 22.04 và sẵn sàng sử dụng với lệnh `packer build`.