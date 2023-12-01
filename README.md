# Docker web server configuration for Unity Web Players

A simple guide for utilizing Docker and Nginx in order locally host and develop Unity Web Players.
<p align="center">
  <img width="100%" src="https://github.com/eldnach/docker-webplayer-server/blob/main/.github/images/docker-nginx-unity.png?raw=true" alt="WebPlayer">
</p

This sample modifies the Nginx server configuration file (`nginx.conf`), in order to serve Unity's (gzip/brotli) precompressed files and accelerate loading times:
<p align="center">
  <img width="100%" src="https://github.com/eldnach/docker-webplayer-server/blob/main/.github/images/nginx-config.png?raw=true" alt="WebPlayer">
</p>

## Instructions
Before starting, please verify that Docker is installed and running (https://docs.docker.com/get-docker/).

Create and navigate to a new project folder. Copy the contents of this repostiory to the root of your newly created project folder.

[Optional] Rename the docker file (`project/docker/project-name.Dockerfile`) and edit the docker-compose file to match the new project name (`project/docker-compose.yml`)
<p align="center">
  <img width="100%" src="https://github.com/eldnach/docker-webplayer-server/blob/main/.github/images/docker-compose.png?raw=true" alt="DockerCompose">
</p>

To reduce application loading times, ensure that Brotli/Gzip compression is enabled in your Unity project's Player Settings (`ProjectSettings -> Player -> Publishing Settings -> Compression Format`), and that "Decompression Fallback" is disabled:
<p align="center">
  <img width="100%" src="https://github.com/eldnach/docker-webplayer-server/blob/main/.github/images/player-settings.png?raw=true" alt="PlayerSettings">
</p>

This repositry includes a sample Unity Player at the webplayer directory (`projet/webplayer`). To overrwrite the project, Build a Unity Web Player and copy the build folder's contents to this directory.

Once the web player folder is ready, open a terminal at the project's root, and build a docker image using the following command: `docker build -t <project-name>:local -f docker/<project-name>.Dockerfile .`

Print and copy the docker image ID using the `docker images` command:
<p align="center">
  <img width="100%" src="https://github.com/eldnach/docker-webplayer-server/blob/main/.github/images/docker-images.png?raw=true" alt="Docker Images">
</p>

Run the docker container using the newly built docker image via the following command: `docker run -p 127.0.0.1:<host-port>:<container-port><image-id>`.

Once the docker container is running, open a web browser and navigate to `127.0.0.1:<host-port>` in order to launch the web player:
<p align="center">
  <img width="100%" src="https://github.com/eldnach/docker-webplayer-server/blob/main/.github/images/web-player.png?raw=true" alt="WebPlayer">
</p>

Note: You can open the developer tools in order to verify that Unity pre-compressed files have been served with the correct `Content-Encoding` header (gzip/br):
<p align="center">
  <img width="100%" src="https://github.com/eldnach/docker-webplayer-server/blob/main/.github/images/content-encoding.png?raw=true" alt="WebPlayer">
</p>
