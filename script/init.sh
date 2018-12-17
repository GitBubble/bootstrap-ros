source ./script/common.func

os=$(JudgeOS)

case ${os} in
  CentOS)
    yum -y install epel-release
    yum -y install python-pip
    yum -y install python-devel;;
  Ubuntu)
    apt install python-pip python-dev -y;;  
  *)
    ;;
esac
