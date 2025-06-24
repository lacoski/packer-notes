

echo "==> waiting for cloud-init to finish"
while [ ! -f /var/lib/cloud/instance/boot-finished ]; do
    echo 'Waiting for Cloud-Init...'
    sleep 1
done

echo "==> updating apt cache"
sudo apt-get update -qq

echo "==> upgrade apt packages"
sudo apt-get upgrade -y -qq

echo "==> installing qemu-guest-agent"
sudo apt-get install -y -qq qemu-guest-agent

echo "==> installing docker-ce"

sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -qq

sudo apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-compose-plugin

sudo apt-get install libopenscap8 -y

wget http://${PACKER_HTTP_IP}:${PACKER_HTTP_PORT}/ssg-ubuntu2204-ds.xml

oscap info ssg-ubuntu2204-ds.xml
oscap info --profile xccdf_org.ssgproject.content_profile_cis_level2_server ssg-ubuntu2204-ds.xml

# Hardening

oscap xccdf generate fix --profile xccdf_org.ssgproject.content_profile_cis_level2_server ssg-ubuntu2204-ds.xml > hardening-cis-ubuntu-2204.sh
bash -x hardening-cis-ubuntu-2204.sh

# Report CIS

sudo mkdir -p /opt/repo
sudo oscap xccdf eval --results result.xml --profile xccdf_org.ssgproject.content_profile_cis_level2_server ssg-ubuntu2204-ds.xml
sudo oscap xccdf generate report result.xml > /opt/repo/ubuntu-2204-report.html


wget https://github.com/aquasecurity/trivy/releases/download/v0.62.1/trivy_0.62.1_Linux-64bit.tar.gz
tar -xzf trivy_0.62.1_Linux-64bit.tar.gz
sudo mv trivy /usr/local/bin/

sudo trivy fs / --scanners vuln --output /opt/repo/trivy-report.log