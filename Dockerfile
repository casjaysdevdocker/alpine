FROM alpine:latest as build

ENV SHELL=/bin/bash \
  TERM=xterm-256color \
  HOSTNAME=${HOSTNAME:-casjaysdev-alpine} \
  TZ=${TZ:-America/New_York}

RUN echo "${TZ}" > /etc/timezone && \
  echo "${HOSTNAME}" >/etc/hostname && \
  apk -U upgrade && \
  apk add --no-cache --upgrade \
  openssl \
  bash \
  bash-completion \
  wget \
  curl \
  jq \
  ca-certificates \
  tzdata \
  mailcap \
  git \
  ncurses \
  util-linux \
  pciutils \
  usbutils \
  coreutils \
  binutils \
  findutils \
  grep \
  iproute2 \
  sudo \
  rsync \
  zip && \
  rm -rf /var/cache/apk/* /tmp/* /var/tmp/* /root/.bashrc /bin/sh && \
  mv -f "/etc/profile.d/color_prompt.sh.disabled" "/etc/profile.d/color_prompt.sh" && \
  ln -sf "/bin/bash" "/bin/sh" && \
  ln -sf "/usr/share/zoneinfo/${TZ}" /etc/localtime && \
  echo 'hosts: files dns' > "/etc/nsswitch.conf" && \
  echo '. /etc/profile' >>"/root/.bashrc" && \
  echo '. /root/.profile' >> "/root/.bashrc" && \
  touch "/etc/profile" "/root/.profile" && \
  sed -i 's|root:x:.*|root:x:0:0:root:/root:/bin/bash|g' "/etc/passwd"

COPY ./bin/. /usr/local/bin/

FROM scratch

ARG BUILD_DATE="$(date +'%Y-%m-%d %H:%M')"

LABEL \
  org.label-schema.name="alpine" \
  org.label-schema.description="Base Alpine Linux" \
  org.label-schema.url="https://hub.docker.com/r/casjaysdevdocker/alpine" \
  org.label-schema.vcs-url="https://github.com/casjaysdevdocker/alpine" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.version=$BUILD_DATE \
  org.label-schema.vcs-ref=$BUILD_DATE \
  org.label-schema.license="WTFPL" \
  org.label-schema.vcs-type="Git" \
  org.label-schema.schema-version="latest" \
  org.label-schema.vendor="CasjaysDev" \
  maintainer="CasjaysDev <docker-admin@casjaysdev.com>"

ENV \
  SHELL=/bin/bash \
  TERM=xterm-256color \
  HOSTNAME=${HOSTNAME:-casjaysdev-alpine} \
  TZ=${TZ:-America/New_York}

COPY --from=build /. /

WORKDIR /root
VOLUME [ "/root" ]

HEALTHCHECK CMD [ "/usr/local/bin/entrypoint-alpine.sh", "healthcheck" ]
ENTRYPOINT [ "/usr/local/bin/entrypoint-alpine.sh" ]
CMD [ "/bin/bash", "-l" ]
