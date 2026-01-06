# Using Tilt Docker Image

- Pull the official Tilt Docker image from Docker Hub:
    ```bash
    docker pull sn1f3rt/tilt
    ```

- Create network bridge so that containers can communicate.
    ```bash
    docker network create --driver bridge tilt
    ```

- Start the daemon.
    ```bash
    docker run -d --rm --name tilt-daemon \
    --net=tilt \
    -v daemon:/data \
    -p 17565:17565 \
    -p 17566:17566 \
    sn1f3rt/tilt \
    tiltd \
    --data-dir=/data \
    --confirm-external-bind \
    --non-interactive
    ```

- Start the CLI wallet.
    ```bash
    docker run --rm -it --name tilt-wallet \
    --net=tilt \
    -v wallet:/data \
    sn1f3rt/tilt \
    tilt-wallet-cli \
    --trusted-daemon \
    --daemon-address tilt-daemon:17566
    ```
