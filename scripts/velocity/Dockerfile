FROM alpine:latest AS build

RUN apk add curl jq

ARG version

WORKDIR /opt/minecraft
COPY ./download-velocity.sh /
RUN chmod +x /download-velocity.sh \
	&& /download-velocity.sh ${version}

########################################################

FROM azul/zulu-openjdk-alpine:17-jre AS runtime

WORKDIR /data

COPY --from=build /opt/minecraft/velocity.jar /opt/minecraft/velocity.jar

VOLUME "/data"

EXPOSE 25565/tcp
EXPOSE 25565/udp

ARG memory_size=3G
ENV MEMORYSIZE=$memory_size

ARG java_flags="-Dlog4j2.formatMsgNoLookups=true -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=mcflags.emc.gs -Dcom.mojang.eula.agree=true"
ENV JAVAFLAGS=$java_flags

WORKDIR /data

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

RUN set -eux; \
	apk update; \
	apk add --no-cache su-exec;

ENTRYPOINT ["/docker-entrypoint.sh"]
