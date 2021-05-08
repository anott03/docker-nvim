# docker-nvim
Just me messing around and trying to figure out how to run neovim from within a docker container – you might find it useful though :)
### usage
Once you have copied the Dockerfile and made any changes you want...
1) build the image
```bash
docker build -t dockernvim .
```
2) run it
```bash
docker run -ti --rm --name nvim -v $PWD:/data dockernvim
```
