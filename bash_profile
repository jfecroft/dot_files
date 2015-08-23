# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin
export PATH

#PYTHONPATH=$PYTHONPATH:/grizzly/bohn/jacr7386/CROFT_PYTHONPATH:/grizzly/bohn/jacr7386/PYTHONPATH:/usr/local/lib/python2.7/site-packages:/Library/Python/2.7/site-packages
#PYTHONPATH=$PYTHONPATH:/grizzly/bohn/jacr7386/CROFT_PYTHONPATH:/grizzly/bohn/jacr7386/PYTHONPATH:/Library/Python/2.7/site-packages
PYTHONPATH=$PYTHONPATH:/grizzly/bohn/jacr7386/CROFT_PYTHONPATH:/grizzly/bohn/jacr7386/PYTHONPATH:/usr/local/lib/python2.7/site-packages
export PYTHONPATH

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
export PATH

# Setting the path for updated vim 7.4
# The original is in /usr/bin/vim
PATH="/opt/local/bin:${PATH}"
export PATH
