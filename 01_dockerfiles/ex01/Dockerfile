FROM debian
EXPOSE 9987/udp 10011 30033
WORKDIR home/teamspeak3-server_linux_amd64
RUN apt-get update -y && apt-get install bzip2 wget -y \
    && wget http://dl.4players.de/ts/releases/3.0.13.8/teamspeak3-server_linux_amd64-3.0.13.8.tar.bz2 && \
    bunzip2 *.bz2 && \
    tar -xvf *.tar && \
    useradd ddevico

ADD ./persist.sh /

CMD ["sh", "teamspeak3-server_linux_amd64/ts3server_minimal_runscript.sh", "/persist"]
