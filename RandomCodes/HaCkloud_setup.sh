#============================#
echo "[#] Adding Kali Linux repository to /etc/apt/sources.list"
#============================#
echo "deb http://http.kali.org/kali kali-rolling main non-free contrib" | sudo tee /etc/apt/sources.list
wget -q -O - https://archive.kali.org/archive-key.asc | apt-key add

#============================#
echo "[#] Updating repository list"
#============================#
apt-get update

#============================#
echo "[#] Installing necessary utils"
#============================#
echo "	[*] Enabling 'main' and 'universal' repository"
sudo add-apt-repository main
sudo add-apt-repository universe

echo "	[*] Installing unzip"
apt install unzip

echo "	[*] Installing golang-go"
apt install golang-go

echo "	[*] Installing python3-pip"
apt install python3-pip

echo "	[*] Installing ruby"
apt install ruby

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

#============================#
echo "[+] Installing amass"
#============================#
#Downloading Amass release v3.10.5 binary zip file
wget https://github.com/OWASP/Amass/releases/download/v3.10.5/amass_linux_amd64.zip -O /tmp/amass.zip

#Unziping and moving binary to /usr/local/bin
unzip /tmp/amass.zip -d /tmp/amass
mv /tmp/amass/amass*/amass /usr/local/bin
chmod +x /usr/local/bin/amass

#============================#
echo "[+] Installing httprobe"
#============================#
go get -u github.com/tomnomnom/httprobe
mv ~/go/bin/httprobe /usr/local/bin
rm -rf ~/go


#============================#
echo "[+] Installing Sublist3r"
#============================#
git clone https://github.com/aboul3la/Sublist3r.git /usr/share/Sublist3r
pip3 install -r /usr/share/Sublist3r/requirements.txt
echo 'cd /usr/share/Sublist3r/; python3 sublist3r.py $@; cd - 1>/dev/null;' > /usr/local/bin/sublist3r
chmod +x /usr/local/bin/sublist3r

#============================#
echo "[+] Installing Subfinder"
#============================#
cd /tmp/
wget https://github.com/projectdiscovery/subfinder/releases/download/v2.4.5/subfinder_2.4.5_linux_amd64.tar.gz -O /tmp/subfinder.tar.gz
tar -xvzf /tmp/subfinder.tar.gz
mv subfinder /usr/local/bin/
chmod +x /usr/local/bin/subfinder
cd - 1>/dev/null


#============================#
echo "[+] Installing Subfinder"
#============================#
sudo apt-get install wpscan

#============================#
echo "[+] Installing Nuclei"
#============================#
cd /tmp
wget https://github.com/projectdiscovery/nuclei/releases/download/v2.1.1/nuclei_2.1.1_linux_amd64.tar.gz -O /tmp/nuclei.tar.gz
tar -xvzf nuclei.tar.gz
mv nuclei /usr/local/bin
chmod +x /usr/local/bin
cd - 1>/dev/null


#============================#
echo "[+] Installing Naabu"
#============================#
cd /tmp
wget https://github.com/projectdiscovery/naabu/releases/download/v2.0.2/naabu_2.0.2_linux_amd64.tar.gz -O naabu.tar.gz
tar -xvzf naabu.tar.gz
mv naabu /usr/local/bin/
chmod +x /usr/local/bin/naabu
cd - 1>/dev/null


#============================#
echo "[+] Installing filter-resolved"
#============================#
go get github.com/tomnomnom/hacks/filter-resolved
mv ~/go/bin/filter-resolved /usr/local/bin/
rm -rf ~/go

#============================#
echo "[+] Installing SecLists wordlists"
#============================#
sudo mkdir /usr/share/wordlists/
cd /usr/share/wordlists
wget https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip
unzip SecLists.zip
rm -f SecLists.zip
cd - 1>/dev/null
