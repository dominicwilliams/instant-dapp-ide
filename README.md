# instant-dapp-ide
Complete Dapp and Solidity development environment as docker image you can run from command line

INSTRUCTIONS  
&nbsp;  
1) Install Docker & open terminal (use special Docker terminal on Mac), then...  
2) If you want to do pair programming, place keys of pairs into ssh/authorized_keys  
3) $ fwd-localhost-to-instance.sh  
4) $ run-instance.sh  

     ___           _              _     ____                      ___ ____  _____ 
    |_ _|_ __  ___| |_ __ _ _ __ | |_  |  _ \  __ _ _ __  _ __   |_ _|  _ \| ____|
     | || '_ \/ __| __/ _` | '_ \| __| | | | |/ _` | '_ \| '_ \   | || | | |  _|  
     | || | | \__ \ || (_| | | | | |_  | |_| | (_| | |_) | |_) |  | || |_| | |___ 
    |___|_| |_|___/\__\__,_|_| |_|\__| |____/ \__,_| .__/| .__/  |___|____/|_____|
                                                   |_|   |_|                      
    
     Build 29-01-28.1
     
     *** TRUFFLE ***
     -- Dapp and contract development environment, testing framework and asset pipeline
     -- Solidity language docs: http://solidity.readthedocs.org/en/latest
     -- Truffle docs: https://github.com/ConsenSys/truffle
     -- ehereumjs-testrpc included so tests run on a simulated blockchain
     ---- $ /usr/bin/testrpc
     -- QUICK START!
     ---- $ mkdir my-new-project
     ---- $ cd my-new-project
     ---- $ truffle init
     ---- $ truffle test
     ---- $ truffle serve      // open Web browser (use port fwding script on OS X)
     
     *** VIM ***
     -- Editor preconfigured with Solidity syntax highlighters, Nerdtree etc
     -- Vim cheat sheet: http://vim.rtorr.com/
     -- QUICK START!
     ---- $ vim
     ---- \nt                  // open nerdtree's file browser
     ---- ctrl W <arrow-key>   // move cursor to desired window/pane
     
     *** TMUX ***
     -- Keep multiple shell sessions open in split screen
     -- Tmux cheat sheet: https://gist.github.com/MohamedAlaa/2961058
     -- Manual, docs etc: https://tmux.github.io/
     -- QUICK START!
     ---- $ tmux
     ---- ctrl B c             // create new shell window
     ---- ctrl B <number>      // select window
     
     Enjoy! Ping me with feature requests via https://twitter.com/dominic_w
