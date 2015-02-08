FROM dockerfile/ubuntu:latest

RUN \
    dpkg --add-architecture i386 && \
    apt-get update -y && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ubuntu-wine/ppa && \
    apt-get update -y && \
    apt-get install -y wine1.7 winetricks xvfb && \
    apt-get purge -y software-properties-common && \
    apt-get autoclean -y && \
    rm -rf /var/lib/apt/lists/* && \
    wget http://us.download.nvidia.com/XFree86/Linux-x86_64/346.35/NVIDIA-Linux-x86_64-346.35.run -O /tmp/nvidia.run && \
    sh /tmp/nvidia.run -s --no-kernel-module && \
    rm -f /tmp/nvidia.run

