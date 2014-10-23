
########### add epel-repo ############
#cat <<EOM | sudo tee -a /etc/yum.repos.d/epel.repo
#[epel]
#name=epel
##baseurl=http://download.fedoraproject.org/pub/epel/6/\$basearch
#baseurl=http://192.168.1.140/yum-repo/epel
#enabled=1
#gpgcheck=0
#EOM

########### epel&remi install #################
rpm -ivh http://192.168.1.140/vmshare/epel-release-6-8.noarch.rpm
rpm -ivh http://192.168.1.140/vmshare/remi-release-6.rpm


############## *.repo backup ###################
cp -p /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
cp -p /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo.bak
cp -p /etc/yum.repos.d/remi.repo /etc/yum.repos.d/remi.repo.bak

############ comment out mirrorlisr ##############
for i in CentOS-Base epel remi ; do
sed -i -e 's/^\(mirrorlist.*\)/#\1/g' /etc/yum.repos.d/$i.repo
done

############### sed yum.repo #################
sed -i -e 's:^#baseurl=http\://mirror.centos.org/centos/$releasever/os/$basearch/:baseurl=http\://192.168.1.140/yum-repo/base/:g' /etc/yum.repos.d/CentOS-Base.repo
sed -i -e 's:^#baseurl=http\://mirror.centos.org/centos/$releasever/updates/$basearch/:baseurl=http\://192.168.1.140/yum-repo/updates/:g' /etc/yum.repos.d/CentOS-Base.repo
sed -i -e 's:^#baseurl=http\://mirror.centos.org/centos/$releasever/extras/$basearch/:baseurl=http\://192.168.1.140/yum-repo/extras/:g' /etc/yum.repos.d/CentOS-Base.repo
sed -i -e 's:^#baseurl=http\://mirror.centos.org/centos/$releasever/centosplus/$basearch/:baseurl=http\://192.168.1.140/yum-repo/centosplus/:g' /etc/yum.repos.d/CentOS-Base.repo
sed -i -e 's:^#baseurl=http\://mirror.centos.org/centos/$releasever/contrib/$basearch/:baseurl=http\://192.168.1.140/yum-repo/contrib/:g' /etc/yum.repos.d/CentOS-Base.repo

############### sed epel.repo #################
sed -i -e 's:^#baseurl=http\://download.fedoraproject.org/pub/epel/6/$basearch:baseurl=http\://192.168.1.140/yum-repo/epel/:g' /etc/yum.repos.d/epel.repo

############### sed remi.repo #################
sed -i -e 's:^#baseurl=http\://rpms.famillecollet.com/enterprise/6/remi/$basearch/:baseurl=http\://192.168.1.140/yum-repo/remi/:g' /etc/yum.repos.d/remi.repo
sed -i -e 's:^#baseurl=http\://rpms.famillecollet.com/enterprise/6/php55/$basearch/:baseurl=http\://192.168.1.140/yum-repo/remi-php55/:g' /etc/yum.repos.d/remi.repo
sed -i -e 's:^#baseurl=http\://rpms.famillecollet.com/enterprise/6/php56/$basearch/:baseurl=http\://192.168.1.140/yum-repo/remi-php56/:g' /etc/yum.repos.d/remi.repo
sed -i -e 's:^#baseurl=http\://rpms.famillecollet.com/enterprise/6/test/$basearch/:baseurl=http\://192.168.1.140/yum-repo/remi-test/:g' /etc/yum.repos.d/remi.repo

############## proxy for git #################
cat <<EOM | sudo tee -a /home/vagrant/.gitconfig
[http]
        proxy = http://proxy2.nttcom.co.jp:8080
[https]
        proxy = http://proxy2.nttcom.co.jp:8080
EOM