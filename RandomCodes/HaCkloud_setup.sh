#============================#
echo "[+] Installing apktool"
#============================#
# To download wrapper script
wget https://raw.githubusercontent.com/iBotPeaches/Apktool/master/scripts/linux/apktool

# Download the .jar file for linux
wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.4.1.jar -O apktool.jar

# Move both files to /usr/local/bin/ and make them executable
mv ./apktool* /usr/local/bin/
chmod +x /usr/local/bin/apktool*

#============================#
echo "[+] Installing ffuf"
#============================#
#Download the v1.1.0 release for Linux-AMD64
wget https://github.com/ffuf/ffuf/releases/download/v1.1.0/ffuf_1.1.0_linux_amd64.tar.gz -O /tmp/ffuf.tar.gz
tar -xvzf /tmp/ffuf.tar.gz

# Move the extracted binary to /usr/local/bin
mv /tmp/ffuf/ffuf /usr/local/bin

# Make the binary executable
chmod +x /usr/local/bin/ffuf