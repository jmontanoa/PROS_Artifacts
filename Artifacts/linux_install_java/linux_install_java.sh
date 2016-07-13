#####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####

### Shell script to download Oracle JDK / JRE / Java binaries from Oracle website using terminal / command / shell prompt using wget.
### You can download all the binaries one-shot by just giving the BASE_URL.
### Script might be useful if you need Oracle JDK on Amazon EC2 env.
### Script is updated for every JDK release.

### Features:-
# 1. Resumes a broken / interrupted [previous] download, if any.
# 2. Renames the file to a proper name with including platform info.
# 3. Downloads the following from Oracle Website with one shell invocation.
#    a. Windows 64 and 32 bit;
#    b. Linux 64 and 32 bit;
#    c. API Docs;
#    d. You can add more to the list of downloads are per your requirement.

#####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####

## Latest JDK8 version released on 19th April, 2016: JDK8u91
BASE_URL_8=http://download.oracle.com/otn-pub/java/jdk/8u66-b17/jdk-8u66

## JDK_VERSION=${BASE_URL_8: -8}
JDK_VERSION=`echo $BASE_URL_8 | rev | cut -d "/" -f1 | rev`

#declare -a PLATFORMS=("-windows-x64.exe" "-linux-x64.tar.gz" "-docs-all.zip" "-windows-i586.exe" "-linux-i586.tar.gz")
platform="-linux-x64.rpm"

wget -c -O "$JDK_VERSION$platform" --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" "${BASE_URL_8}${platform}"
### wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "${BASE_URL_8}${platform}"
### curl -L -O -H "Cookie: oraclelicense=accept-securebackup-cookie" -k "${BASE_URL_8}${platform}"

rpm -ivh $JDK_VERSION$platform
echo -e '\n'
echo 'export JAVA_HOME=/usr/java/jdk1.8.0_66' >> .bashrc
echo -e '\n'
echo 'export PATH=$PATH:$JAVA_HOME/bin' >> .bashrc
source ~/.bashrc



#####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####   #####

## Earlier versions:
## v8u77 => http://download.oracle.com/otn-pub/java/jdk/8u77-b03/jdk-8u77
## v8u73 => http://download.oracle.com/otn-pub/java/jdk/8u73-b02/jdk-8u73
## v8u71 => http://download.oracle.com/otn-pub/java/jdk/8u71-b15/jdk-8u71
## v8u65 => http://download.oracle.com/otn-pub/java/jdk/8u65-b17/jdk-8u65
## v8u60 => http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60
## v8u51 => http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51
## v8u45 => http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45
## v8u40 => http://download.oracle.com/otn-pub/java/jdk/8u40-b25/jdk-8u40
## v8u31 => http://download.oracle.com/otn-pub/java/jdk/8u31-b13/jdk-8u31
## v8u25 => http://download.oracle.com/otn-pub/java/jdk/8u25-b17/jdk-8u25