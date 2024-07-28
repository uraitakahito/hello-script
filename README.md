![MacOS](https://img.shields.io/badge/sonoma_14.2.1-support-success.svg?style=for-the-badge&logo=macOS)
![Windows](https://img.shields.io/badge/windows-nosupport-critical.svg?style=for-the-badge&logo=windows)

## Attach to a running container

- Run the Docker Desktop application to start Docker.

Build the image:

```console
% PROJECT=$(basename `pwd`)
% docker image build -t $PROJECT-image . --build-arg user_id=`id -u` --build-arg group_id=`id -g`
```

Run docker containers:

```console
% docker container run -it --rm --init --mount type=bind,src=`pwd`,dst=/app --name $PROJECT-container $PROJECT-image /bin/zsh
```

Select **[Dev Containers: Attach to Running Container](https://code.visualstudio.com/docs/devcontainers/attach-container#_attach-to-a-docker-container)** through the **Command Palette (Shift + command + P)**

Finally, Open the `/app`.

### Tips

#### Running a command and then killing it

```console
% docker container run -it --rm --init --name $PROJECT-container $PROJECT-image ls /
```

#### How to save zsh history

To save history, create volume:

```console
% docker volume create zsh-volume
% docker run -it --rm -v zsh-volume:/zsh-volume alpine touch /zsh-volume/.zsh_history
% docker run -it --rm -v zsh-volume:/zsh-volume alpine chown -R `id -u`:`id -g` /zsh-volume
% docker run -it --rm -v zsh-volume:/zsh-volume alpine /bin/ash
```

And run docker containers with volume:

```console
% docker run -d --rm --init --mount type=volume,src=zsh-volume,dst=/zsh-volume --name $PROJECT-container $PROJECT-image
% docker exec -it $PROJECT-container zsh
% ln -fs /zsh-volume/.zsh_history ~/.zsh_history
```

## Memo

[snippets](../../wiki/snippets)
