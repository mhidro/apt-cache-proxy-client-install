# apt-cache-proxy-client-install

You should probably fork this and change the server url

```bash
sudo apt-get update && \
sudo apt-get install -y wget tar && \
wget -qO- https://codeload.github.com/mhidro/apt-cache-proxy-client-install/tar.gz/refs/tags/v1.0 | tar -xzO apt-cache-proxy-client-install-1.0/aptproxyinstall.sh | sudo bash
