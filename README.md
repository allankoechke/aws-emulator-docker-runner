# AWS Emulator

Run the AWS Emulator with Docker Compose.

## Start

```sh
docker compose up --build
```

The service listens on *127.0.0.1:9297*. Ports **9298–9317** are also exposed on localhost. Emulator data is persisted in the aws-emulator-data Docker volume.

Choose the package architecture
The Docker build selects the RPM architecture from the target platform by default. To override it:


Accepted values: **amd64** or **x86_64**, and **arm64** or **aarch64**. The selected package should match the image platform.