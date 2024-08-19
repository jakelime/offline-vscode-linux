# install vs-code-server.sh

commit_id='fee1edb8d6d72a0ddff41e5f71a671c23ed924b9'
mkdir -p ~/.vscode-server/bin/${commit_id}
tar zxvf vscode-server-linux-x64.tar.gz -C ~/.vscode-server/bin/${commit_id} --strip 1
touch ~/.vscode-server/bin/${commit_id}/0