FROM ubuntu:22.04
RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list && \
    sed -i s@/security.ubuntu.com/@/mirrors.ustc.edu.cn/@g /etc/apt/sources.list && \
    sed -i s@/ports.ubuntu.com/@/mirrors.ustc.edu.cn/@g /etc/apt/sources.list  && \
    echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup && \
    echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache && \
    echo 'Acquire::Languages "none";' > /etc/apt/apt.conf.d/no-lang && \
    sed -i  '$a\chmod -R 777 /tftpboot'  ~/.bashrc &&\
    sed -i  '$a\sudo service tftpd-hpa restart'  ~/.bashrc
RUN	apt update && \
	apt -y install tftpd-hpa tftp-hpa sudo vim && \
    rm -r /var/lib/apt/lists/*
# RUN sudo timedatectl set-ntp on
# RUN pip install paramiko scp
# COPY . /root/calib_merge_pub
COPY tftpd-hpa /etc/default/
# RUN chmod -R 777 /tftpboot

# ENTRYPOINT ["/entrypoint.sh"]