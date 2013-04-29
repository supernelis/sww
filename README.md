
# Sww - Softwarewolves Ruby Bot

This is an example implementation of a bot in ruby for the digital version of the werewolves party game (rebranded to softwarewolves game). The bot does not do much - it implements the lazy villager story.

More information on the softwarewolves game can be found at : [Softwarewolves documentation][1].

## Setting up the project


### 1. Get the code 


With github, there are several possibilities:
* Download the project as a zipfile from github (github button somewhere on page). 
* Fork the project to your own github repository (github button somewhere on page), then clone it. This requires a github account.
* Clone the repository to your own computer. This requires git to be installed on your system. For cloning, you can use your favorite git tool or the following command:

```
        git clone https://github.com/rwestgeest/sww.git
        
```

### 2. Installation

Make sure that bundler is installed.
If

    $ gem list --local

does not show it up, it is not.
In this case, you should install it, probably as root:

    $ sudo gem install bundler

If you then

    $ cd <installation dir>

and execute:

    $ bundle

it will pull in dependencies, namely xmpp4r.

### 3. Usage

Configure your bots username and password, and the jabber xmpp server and game coordinator in bin/swwbot.rb

Run

    $ bin/swwbot.rb

### 4. Test

Test using 

```bash
rake
```

A guardfile is included so run

```bash
guard
```

to run tests of file that change automatically.
### 5. Documentation

The bot relies heavily on the xmpp4r gem.
You can find its RDoc at http://home.gna.org/xmpp4r/rdoc/.

### 6. Pushing your contributions to the original repository

1. Fork it to your own repository
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
