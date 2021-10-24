FROM fpc-base:latest

ARG HOSTNAME
ARG GID=1000
ARG UID=1000
ARG SHELL=/usr/bin/bash
ARG HOME_DIR=/home/$HOSTNAME
ARG SSH_DIR=$HOME_DIR/.ssh

COPY ./ssh/$HOSTNAME.pub /$HOSTNAME.pub

RUN groupadd -g $GID $HOSTNAME \
    && useradd -g $GID -u $UID -s $SHELL -m -p $HOSTNAME $HOSTNAME \
    && mkdir $SSH_DIR \
    && chown $HOSTNAME:$HOSTNAME $SSH_DIR \
    && chmod 0700 $SSH_DIR \
    && mv /$HOSTNAME.pub $SSH_DIR/authorized_keys \
    && chown $HOSTNAME:$HOSTNAME $SSH_DIR/authorized_keys \
    && chmod 0400 $SSH_DIR/authorized_keys

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
