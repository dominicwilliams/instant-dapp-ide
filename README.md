# instant-dapp-ide
Complete Dapp and Solidity development environment as docker image you can run from command line

INSTRUCTIONS  
&nbsp;  
1) Install Docker & open Docker terminal (on Mac) then...
2) $ fwd-localhost-to-instance.sh  
3) $ pull-latest-image.sh
4) $ run-instance.sh  

     ___           _              _     ____                      ___ ____  _____   
    |_ _|_ __  ___| |_ __ _ _ __ | |_  |  _ \  __ _ _ __  _ __   |_ _|  _ \| ____|  
     | || '_ \/ __| __/ _` | '_ \| __| | | | |/ _` | '_ \| '_ \   | || | | |  _|  
     | || | | \__ \ || (_| | | | | |_  | |_| | (_| | |_) | |_) |  | || |_| | |___ 
    |___|_| |_|___/\__\__,_|_| |_|\__| |____/ \__,_| .__/| .__/  |___|____/|_____|  
                                                   |_|   |_|                      
    
     Build 2016-02-29.1

     GET STARTED
     $ tmux new -s pair       # create session 0...
     $ testrpc -d 0.0.0.0     # launch dummy blockchain for dev/testing
     $ ctrl-b c               # create session 1...
     $ c9.sh                  # launch Cloud9 IDE http://localhost:8181/
     $ ctrl-b c               # create session 2...
     $ cd /src                # enter mounted external source folder
     $ mkdir new-proj         # create new project folder
     $ cd new-proj            # enter project folder
     $ truffle init           # initialize bare bones project
     $ truffle test           # run project's unit tests!!!
     $ truffle build          # build the whole dapp (inc. html, js...)
     $ truffle deploy         # stick compiled contracts on testrpc chain
     $ ctrl-b c               # create session 3...
     $ truffle serve          # serve dapp & test http://localhost:8080
     $ ctrl-b 2               # return session 2 & continue with truffle

     TIPS
     -- Share your Cloud9 url with collaborators (via external IP)
     ---- Cloud9 supports real time shared editing of code
     -- If you prefer using the terminal we have installed VIM
     ---- Ready pimped with NerdTree and Solidity support
     -- SSH server is installed for sharing the command line
     ---- Pairs join tmux sessions using $ tmux a -t pair

     DOCS
     -- https://media.readthedocs.org/pdf/solidity/latest/solidity.pdf
     -- https://github.com/ConsenSys/truffle
     -- https://gist.github.com/MohamedAlaa/2961058 [tmux]
     
     Enjoy! Ping me with feature requests via https://twitter.com/dominic_w
