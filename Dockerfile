FROM node:12.13.1

ARG host=localhost
ARG port=5000

ARG static_files_host=localhost
ARG static_files_port=5001

ARG static_files_admin_host=localhost
ARG static_files_admin_port=5002

ARG postgres_host=localhost
ARG postgres_port=5432
ARG postgres_uid=postgres
ARG postgres_pwd=postgres
ARG postgres_db=polis-dev

ENV DATABASE_URL postgres://${postgres_uid}:${postgres_pwd}@${postgres_host}:${postgres_port}/${postgres_db}
ENV DOMAIN_OVERRIDE ${host}:${port}
ENV PORT ${port}

ENV STATIC_FILES_HOST ${static_files_host}
ENV STATIC_FILES_PORT ${static_files_port}
ENV STATIC_FILES_ADMINDASH_PORT ${static_files_admin_port}

WORKDIR /app

COPY . .

RUN npm install

EXPOSE ${port}

CMD npm run docker
