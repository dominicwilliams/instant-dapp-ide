# Instant Dapp IDE
Get up and running with a full professional Dapp development environment in minutes...
* If you have Docker installed, simply clone the repo, then
```
./run-image.sh
```

* Environment incorporates best-of-breed Truffle Framework (see http://truffleframework.com/docs/)

* Browser-based Cloud9 IDE with Solidity support on http://localhost:8181

* Build, test, deploy and serve your Dapp from the command line

* Pair program with Cloud9, or SSH/tmux

* Your ~/src folder mapped inside image 
  
TIPS 

1. If you have an old Docker version on OS X, setup port forwarding
```
$ ./setup-port-fowarding-for-old-docker.sh  
```
  
2. You can pull the latest version of the image from DockerHub
```
$ ./pull-latest-image.sh  
```

** 
```
 ___           _              _     ____                      ___ ____  _____ 
|_ _|_ __  ___| |_ __ _ _ __ | |_  |  _ \  __ _ _ __  _ __   |_ _|  _ \| ____|
 | || '_ \/ __| __/ _` | '_ \| __| | | | |/ _` | '_ \| '_ \   | || | | |  _|  
 | || | | \__ \ || (_| | | | | |_  | |_| | (_| | |_) | |_) |  | || |_| | |___ 
|___|_| |_|___/\__\__,_|_| |_|\__| |____/ \__,_| .__/| .__/  |___|____/|_____|
                                               |_|   |_|                      

 Build 2016-12-08.1
 
 *** GET STARTED ***
 tmux is used to maintain concurrent windows. In window 0 we are running
 testrpc, which is a dummy blockchain for testing and development. In window 1
 we are running c9.sh, which makes the Cloud9 IDE available in a Web browser on
 http://localhost:8181. You are in window 2, which is a great place to build
 a Dapp. Note you can create new windows using ctrl-b c, and you can
 navigate to an existing window using ctrl-b <window>.
 
 SAMPLE BUILD PROCESS...
 $ mkdir new-proj         # create a new project folder
 $ cd new-proj            # make project folder current directory
 $ truffle init           # initialize a bare bones project!!!
 $ truffle compile        # compile project contracts
 $ truffle test           # run project's unit tests
 $ truffle build          # build the whole Dapp (inc. html, js...)
 $ truffle migrate        # migrate compiled contracts to e.g. testrpc chain
 $ truffle serve          # serve Dapp for testing on http://localhost:8080
 
 TIPS
 -- Share your Cloud9 url with collaborators on your external IP address
 ---- Cloud9 supports real time shared editing of code
 -- If you prefer using the terminal we have installed VIM
 ---- Ready pimped with NerdTree and Solidity support
 -- An SSH server makes it possible to share tmux session
 ---- Pair programmers join tmux sessions using $ tmux a -t pair
 
 DOCS
 -- http://truffleframework.com/ [Truffle]
 -- https://media.readthedocs.org/pdf/solidity/latest/solidity.pdf [Solidity]
 -- https://gist.github.com/MohamedAlaa/2961058 [tmux]
 
 Enjoy! Ping me with feature requests via https://twitter.com/dominic_w
```
