FROM centos:7

LABEL name="CentOS Base Image" \
    vendor="CentOS" \
    license="GPLv2" \
    build-date="20170801"

RUN yum -y install git
&& yum -y install bzip2
curl -L \
https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer \
| bash 
&& echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
&& echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
&& echo 'eval "$(pyenv init -)"' >> ~/.bashrc
&& echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
&& source ~/.bashrc
&& pyenv install anaconda3-4.4.0
&& pyenv globol anaconda3-4.4.0
&& conda create --name project python=3.5 anaconda -y
&& source activate project


RUN pip install tensorflow ; 
pip install keras ;
pip install requests ;
pip install beautifulsoup4 ;
pip install pymysql ;
pip install pymongo ;

#mkdir workspace dir 
RUN mkdir ~/project

VOLUME ~/project

CMD ["/bin/bash"]




