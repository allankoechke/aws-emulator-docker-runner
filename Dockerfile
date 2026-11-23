
FROM public.ecr.aws/amazonlinux/amazonlinux:2023-minimal

# aws-emulator-aarch64.rpm
# aws-emulator-x86_64.rpm

ADD https://downloads.aws.com/aws-emulator/packages/aws-emulator/LTS/latest/aws-emulator-aarch64.rpm /tmp/aws-emulator.rpm

RUN rpm -i /tmp/aws-emulator.rpm \
    && rm /tmp/aws-emulator.rpm \
    && mkdir -p /home/emulator \
    && chown 1000:1000 /home/emulator

USER 1000

ENV HOME=/home/emulator
ENV EMULATOR_BIND_ADDRESS=0.0.0.0

EXPOSE 9297

ENTRYPOINT ["aws-emulator"]
