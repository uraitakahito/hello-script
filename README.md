![MacOS](https://img.shields.io/badge/sonoma_14.2.1-support-success.svg?style=for-the-badge&logo=macOS)
![Windows](https://img.shields.io/badge/windows-nosupport-critical.svg?style=for-the-badge&logo=windows)

## How to start up

Build your dockage image:

```sh
PROJECT=$(basename `pwd`) && docker image build -t $PROJECT-image . --build-arg user_id=`id -u` --build-arg group_id=`id -g`
```

Run docker containers:

```sh
docker container run -it --rm --init --mount type=bind,src=`pwd`,dst=/app --name $PROJECT-container $PROJECT-image /bin/zsh
```

Run the following commands inside the Docker containers. You can use the Integrated Terminal **(⌃`)** directly in VS Code.

```sh
./step_by_step.sh
```

## Attach to a running container

1. Select `Dev Containers: Attach to Running Container` through the `Command Palette (Shift + command + P)` ([code.visualstudio.com](https://code.visualstudio.com/docs/devcontainers/attach-container#_attach-to-a-docker-container))
2. Open the `/app`

## Tips

### How to save zsh history

To save history, create volume:

```sh
docker volume create zsh-volume
docker run -it --rm -v zsh-volume:/zsh-volume alpine touch /zsh-volume/.zsh_history
docker run -it --rm -v zsh-volume:/zsh-volume alpine chown -R `id -u`:`id -g` /zsh-volume
docker run -it --rm -v zsh-volume:/zsh-volume alpine /bin/ash
```

And run docker containers with volume:

```sh
docker run -d --rm --init --mount type=volume,src=zsh-volume,dst=/zsh-volume --name $PROJECT-container $PROJECT-image
docker exec -it $PROJECT-container zsh
ln -fs /zsh-volume/.zsh_history ~/.zsh_history
```

## Memo

[snippets](../../wiki/snippets)
