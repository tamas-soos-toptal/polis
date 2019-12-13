FROM node:12.13.1

VOLUME ["/app"]
WORKDIR /app

EXPOSE 5000

CMD [/bin/sh -c "[ -e /bin/bash ] && /bin/bash || /bin/sh"]
