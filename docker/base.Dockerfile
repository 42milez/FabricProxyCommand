FROM amazonlinux:2.0.20211005.0

# https://qiita.com/YumaInaura/items/1d5c18a9e55484ccad89
# https://stackoverflow.com/questions/36292317/why-set-visible-now-in-etc-profile
# https://www.garron.me/en/linux/sshd-no-hostkeys-available-exiting.html

# ENV NOTVISIBLE "in users profile"
# RUN echo "export VISIBLE=now" >> /etc/profile

RUN yum update \
    && yum install -y openssh-server \
    && ssh-keygen -A \
    && yum -y clean all \
    && rm -rf /var/cache
