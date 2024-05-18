[snippets](../../wiki/snippets)

![MacOS](https://img.shields.io/badge/sonoma_14.2.1-support-success.svg?style=for-the-badge&logo=macOS)
![Windows](https://img.shields.io/badge/windows-nosupport-critical.svg?style=for-the-badge&logo=windows)

## Usage

### Use Visual Studio Code (recommended)

The **[Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)** supports two primary operating models:

1. You can use a container as your full-time development environment
2. You can attach to a running container to inspect it

#### 1. container as your full-time development environment (recommended)

- Run the Docker Desktop application to start Docker.
- Open the **Command Palette** (Command + Shift + P) to run the command **Dev Containers: Reopen in Container**
- Check the development environment by opening the **Terminal** (Ctrl + Shift + `)

#### 2. Attach to a running container

- Run the Docker Desktop application to start Docker.

Build the image:

```console
% PROJECT=$(basename `pwd`)
% docker image build -t $PROJECT-image ./.devcontainer --build-arg user_id=`id -u` --build-arg group_id=`id -g`
```

Run docker containers:

```console
% docker container run -d --rm --init --mount type=bind,src=/Users/xxx/dotfiles,dst=/workspaces/$PROJECT --mount type=bind,src=/foo/bar,dst=/workspaces/bar --name $PROJECT-container $PROJECT-image
```

And Open the **Command Palette** to run the command **Dev Containers: Attach to Running Container**

See Also: [Attach to a Docker container](https://code.visualstudio.com/docs/devcontainers/attach-container#_attach-to-a-docker-container)

##### Choose the -v or --mount flag

New users should use the `--mount` syntax. Experienced users may be more familiar with the `-v` or `--volume` syntax, but are encouraged to use `--mount`, because research has shown it to be easier to use.

See Also: [Bind mounts](https://docs.docker.com/storage/bind-mounts/)

### Vim or Emacs (in other words, only terminal)

The procedure is the same up to the point where the container is started.

Execute zsh within a running Docker container:

```console
% docker exec -it $PROJECT-container /bin/zsh
```

And type vim or emacs :-D

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
