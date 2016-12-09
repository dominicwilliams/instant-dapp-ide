# instant-dapp-ide
Instant Dapp IDE is a complete development platform for creating Dapps that has
been packaged into a docker image that just works!

The development environment is based around the Truffle Framework, which
greatly simplifies Dapp development and deployment while providing full access
to the powerful underlying technology (see http://truffleframework.com/docs/).

Once you have installed Docker, all you need to do is execute the run-image.sh
script and the instant-dapp-ide image will be downloaded and run, whereupon
you will be logged in and are ready to go!

The system hosts a customized Cloud9 IDE on port 8181, and has fully prepared
versions of VIM and other popular tools. 

You can easily pair program, either by sharing the URL of your Cloud9 IDE
(simultaneous editing on files is possible, like on Google Docs), and the
system hosts an SSHD server in case you would rather share the terminal.

Days of configuration and setup disappear! :)
  
INSTRUCTIONS 
  
NOTE: Your ~/src folder is mapped into the image as your workspace folder.

1. OPTIONAL: If you have an old Docker version on OS X, setup port forwarding
   (plus open a special docker terminal to start the image)
$ ./setup-port-fowarding-for-old-docker.sh  
  
2. OPTIONAL: Update to the latest version of instant-dapp-ide
$ ./pull-latest-image.sh  

3. Run the platform...
$ ./run-image.sh  
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
 $ cd /src                # make external source code folder current directory
 $ mkdir new-proj         # create a new project folder
 $ cd new-proj            # make project folder current directory
 $ truffle init           # initialize a bare bones project!!!
 $ truffle compile        # compile project contracts
 $ truffle test           # run project's unit tests
 $ truffle build          # build the whole Dapp (inc. html, js...)
 $ truffle migrate        # migrate compiled contracts to e.g. testrpc chain
 $ ctrl-b c               # create window 3...
 $ truffle serve          # serve Dapp for testing on http://localhost:8080
 $ ctrl-b 2               # return window 2
 
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
