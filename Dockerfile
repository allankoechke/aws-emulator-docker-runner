
FROM public.ecr.aws/amazonlinux/amazonlinux:2023-minimal

ARG TARGETARCH
ARG AWS_EMULATOR_ARCH=${TARGETARCH}

RUN case "${AWS_EMULATOR_ARCH}" in \
      amd64|x86_64) rpm_arch=x86_64 ;; \
      arm64|aarch64) rpm_arch=aarch64 ;; \
      *) echo "Unsupported AWS_EMULATOR_ARCH: ${AWS_EMULATOR_ARCH}" >&2; exit 1 ;; \
    esac \
    && curl --fail --location --silent --show-error \
      "https://downloads.aws.com/aws-emulator/packages/aws-emulator/LTS/latest/aws-emulator-${rpm_arch}.rpm" \
      --output /tmp/aws-emulator.rpm \
    && rpm -i /tmp/aws-emulator.rpm \
    && rm /tmp/aws-emulator.rpm \
    && mkdir -p /home/emulator \
    && chown 1000:1000 /home/emulator

USER 1000

ENV HOME=/home/emulator
ENV EMULATOR_BIND_ADDRESS=0.0.0.0

EXPOSE 9297

ENTRYPOINT ["aws-emulator"]
