# dwpa-worker-docker

Docker container companion to [dwpa-web-docker](https://github.com/iganev/dwpa-web-docker).  

Executes `help_crack.py` in a CUDA-enabled container to utilize available Nvidia GPUs for auditing.  

## Setup

Make sure you have properly setup and running instance of [dwpa-web-docker](https://github.com/iganev/dwpa-web-docker) or alternatively you can use the worker to contribute to the public/original instance (default behavior).  

Make sure you have properly setup nvidia drivers and nvidia-docker container environment.  

Edit the `.env` file to reflect your setup.  

## Running

## Variables

`PUBLIC_URL`: The full address corresponding to `DWPA_PUBLIC_URL` of your `dwpa-web-docker` setup.  
`COPTIONS`: Passed directly as `coptions` parameter to `help_crack.py` which in turn get passes them directly to `hashcat`.  
`EXTRA_DICT`: Valid filename of a file located in the `dicts` folder to be passed as `ad` option `help_crack.py`. Meaning, additional dictionary file to be included separately to the dictionaries defined by the `dwpa` instance.  
`RULES`: Space-separated list of valid filenames of files located in the `rules` folder to be passed using `-r` to hashcat as extra lists of rules to load.  