docker build --no-cache -t tftp_server . 
docker run -dit -v /home/anglersking/tftpboot:/tftpboot --net=host --name=tftp-server tftp_server