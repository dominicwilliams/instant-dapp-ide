FROM ubuntu:trusty
MAINTAINER dominicwilliams

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get upgrade -q -y
RUN apt-get dist-upgrade -q -y

RUN apt-get install -y strace
RUN apt-get install -y curl
RUN apt-get install -y vim
RUN apt-get install -y git

RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
RUN apt-get install -y nodejs
RUN apt-get install -y python
RUN apt-get install -y python-pip
RUN apt-get install -y python-dev
RUN apt-get install -y libssl-dev

# Install testrpc and Truffle directly from github as PIP and NPM not regularly
# updated (e.g. make sure we have latest version solc)
# testrpc
WORKDIR /tmp
RUN git clone https://github.com/Consensys/testrpc
WORKDIR /tmp/testrpc
RUN pip install -r requirements.txt
# Truffle
WORKDIR /tmp
RUN git clone https://github.com/ConsenSys/truffle.git
WORKDIR /tmp/truffle
RUN npm install -g .

RUN npm install -y -g truffle

# Install tmux to gain split screen management and screen sharing capabilities
RUN apt-get install -y tmux

RUN apt-get install -y rake

# Pimp VIM with Nerd Tree and other goodies using the Braintree setup
WORKDIR /root
RUN git clone https://github.com/braintreeps/vim_dotfiles.git
WORKDIR /root/vim_dotfiles
RUN rake

RUN echo 'set encoding=utf-8' >> /root/.vimrc

# Configure VIM with support for Solidity
WORKDIR /root/.vim
RUN curl -o vim-solidity-master.zip https://codeload.github.com/tomlion/vim-solidity/zip/master
RUN unzip vim-solidity-master.zip
RUN mv vim-solidity-master/* .

# Add an SSH server for social hacking i.e. pair/multi programming and configure run on port 2222
RUN apt-get install -y openssh-server
RUN sed -i '/Port 22/c\Port 2222' /etc/ssh/sshd_config
RUN sed -i '/LogLevel INFO/c\LogLevel VERBOSE' /etc/ssh/sshd_config
RUN sed -i '/PasswordAuthentication yes/c\PasswordAuthentication no' /etc/ssh/sshd_config 
RUN mkdir /var/run/sshd
RUN mkdir /root/.ssh

# Additionally add Cloud9 pair programming environment
WORKDIR /opt
RUN git clone git://github.com/c9/core.git cloud9
WORKDIR /opt/cloud9
RUN scripts/install-sdk.sh
# patch for solidty syntax
ADD patches/c9/node_modules/ace/lib/ace/ext/modelist.js /opt/cloud9/node_modules/ace/lib/ace/ext/modelist.js
ADD patches/c9/node_modules/ace/lib/ace/mode/solidity.js /opt/cloud9/node_modules/ace/lib/ace/mode/solidity.js
ADD patches/c9/node_modules/ace/lib/ace/mode/solidity_highlight_rules.js /opt/cloud9/node_modules/ace/lib/ace/mode/solidity_highlight_rules.js
ADD patches/c9/node_modules/ace/lib/ace/snippets/solidity.js /opt/cloud9/node_modules/ace/lib/ace/snippets/solidity.js
# make C9 server runnable (user needs to run $ c9.sh to launch platform)
RUN mkdir /opt/cloud9/workspace
WORKDIR /opt/cloud9/workspace
RUN ln -s /src src
RUN echo 'cd /opt/cloud9;node server.js --collab -p 8181  --listen 0.0.0.0 -a : -w /opt/cloud9/workspace' > /usr/local/bin/c9.sh
RUN chmod ugo+x /usr/local/bin/c9.sh

# Create an instructive welcome message
RUN apt-get install -y figlet

RUN echo 'figlet Instant Dapp IDE' >> /root/.bashrc
RUN echo 'echo "\n\
 Build 16-01-28.1\n\
 \n\
 *** TRUFFLE ***\n\
 -- Dapp and contract development environment, testing framework and asset pipeline\n\
 -- Solidity language docs: http://solidity.readthedocs.org/en/latest\n\
 -- Truffle docs: https://github.com/ConsenSys/truffle\n\
 -- eth-testrpc included so tests run on a simulated blockchain\n\
 ---- $ /usr/local/bin/testrpc -d 0.0.0.0\n\
 -- QUICK START!\n\
 ---- $ mkdir my-new-project\n\
 ---- $ cd my-new-project\n\
 ---- $ truffle init\n\
 ---- $ truffle test\n\
 ---- $ truffle serve\n\
 ---- Open Web browser http://localhost:8080/ (port forwarding must be running)\n\
 \n\
 *** VIM ***\n\
 -- Editor preconfigured with Solidity syntax highlighters, Nerdtree etc\n\
 -- Vim cheat sheet: http://vim.rtorr.com/\n\
 -- QUICK START!\n\
 ---- $ vim\n\
 ---- \\nt                  // open nerdtree'"'s"' file browser\n\
 ---- ctrl W <arrow-key>   // move cursor to desired window/pane\n\
 \n\
 *** TMUX ***\n\
 -- Keep multiple shell sessions open in split screen\n\
 -- Tmux cheat sheet: https://gist.github.com/MohamedAlaa/2961058\n\
 -- Manual, docs etc: https://tmux.github.io/\n\
 -- QUICK START!\n\
 ---- $ tmux new -s pair   // named session pair programmers can join\n\
 ---- ctrl B c             // create new shell window\n\
 ---- ctrl B <number>      // select window\n\
 \n\
 Enjoy! Ping me with feature requests via https://twitter.com/dominic_w\n\
"' >> /root/.bashrc

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# On entry, start sshd, run system loggger, copy pair programming keys into authorized keys, and run bash
ENTRYPOINT service ssh start && rsyslogd && cp /root/.import/authorized_keys /root/.ssh/ && bash

# Start user in their source code directory...
WORKDIR /src

