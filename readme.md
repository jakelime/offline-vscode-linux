# Helper to install vscode-server-linux Offline on WSL

On a computer with restricted/firewall access, VScode running in WSL can run into problems.

```shell
root@n1-somepc-1:~/documents# code .
Updating VS Code Server to version fee1edb8d6d72a0ddff41e5f71a671c23ed924b9
Removing previous installation...
Installing VS Code Server for Linux legacy-x64 (fee1edb8d6d72a0ddff41e5f71a671c23ed924b9)
Downloading: 100%
Failed
--2024-08-19 14:17:14--  https://update.code.visualstudio.com/commit:fee1edb8d6d72a0ddff41e5f71a671c23ed924b9/server-linux-legacy-x64/stable
Resolving update.code.visualstudio.com (update.code.visualstudio.com)... 13.107.246.59, 2620:1ec:bdf::59
Connecting to update.code.visualstudio.com (update.code.visualstudio.com)|13.107.246.59|:443... connected.
ERROR: cannot verify update.code.visualstudio.com's certificate, issued by ‘CN=Menlo Security Intermediate CA,OU=Production,O=Menlo Security Inc.,ST=California,C=US’:
  Unable to locally verify the issuer's authority.
To connect to update.code.visualstudio.com insecurely, use `--no-check-certificate'.
ERROR: Failed to download https://update.code.visualstudio.com/commit:fee1edb8d6d72a0ddff41e5f71a671c23ed924b9/server-linux-legacy-x64/stable to /root/.vscode-server/bin/fee1edb8d6d72a0ddff41e5f71a671c23ed924b9-1724048233.tar.gz
Please install missing certificates.
Debian/Ubuntu:  sudo apt-get install ca-certificates

root@N1-somepc-1:~/documents# sudo apt-get install ca-certificates
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
ca-certificates is already the newest version (20230311ubuntu0.22.04.1).
0 upgraded, 0 newly installed, 0 to remove and 142 not upgraded.

root@N1-5CD3401JCR-1:~/documents# code .
Updating VS Code Server to version fee1edb8d6d72a0ddff41e5f71a671c23ed924b9
Removing previous installation...
Installing VS Code Server for Linux legacy-x64 (fee1edb8d6d72a0ddff41e5f71a671c23ed924b9)
Downloading: 100%
Failed
--2024-08-19 14:17:29--  https://update.code.visualstudio.com/commit:fee1edb8d6d72a0ddff41e5f71a671c23ed924b9/server-linux-legacy-x64/stable
Resolving update.code.visualstudio.com (update.code.visualstudio.com)... 13.107.246.59, 2620:1ec:bdf::59
Connecting to update.code.visualstudio.com (update.code.visualstudio.com)|13.107.246.59|:443... connected.
ERROR: cannot verify update.code.visualstudio.com's certificate, issued by ‘CN=Menlo Security Intermediate CA,OU=Production,O=Menlo Security Inc.,ST=California,C=US’:
  Unable to locally verify the issuer's authority.
To connect to update.code.visualstudio.com insecurely, use `--no-check-certificate'.
ERROR: Failed to download https://update.code.visualstudio.com/commit:fee1edb8d6d72a0ddff41e5f71a671c23ed924b9/server-linux-legacy-x64/stable to /root/.vscode-server/bin/fee1edb8d6d72a0ddff41e5f71a671c23ed924b9-1724048249.tar.gz
Please install missing certificates.
```

## Solution


```shell
# https://stackoverflow.com/questions/56671520/how-can-i-install-vscode-server-in-linux-offline
commit_id=fee1edb8d6d72a0ddff41e5f71a671c23ed924b9

# Download url is: https://update.code.visualstudio.com/commit:${commit_id}/server-linux-x64/stable
curl -sSL "https://update.code.visualstudio.com/commit:${commit_id}/server-linux-x64/stable" -o vscode-server-linux-x64.tar.gz

mkdir -p ~/.vscode-server/bin/${commit_id}
tar zxvf vscode-server-linux-x64.tar.gz -C ~/.vscode-server/bin/${commit_id} --strip 1
touch ~/.vscode-server/bin/${commit_id}/0
```

### Example

1. On a PC with internet connection, download https://update.code.visualstudio.com/commit:fee1edb8d6d72a0ddff41e5f71a671c23ed924b9/server-linux-x64/stable
1. Transfer over to restricted PC's working dir, i.e. `~/downloads`
1. Launch `wsl`. i.e. `root@N1-mypc-1:/mnt/c/Users/70014156/Downloads# sh install-vs-code-server.sh`


