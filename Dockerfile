FROM postgres:16.4

COPY ./sql/init/ /docker-entrypoint-initdb.d/

EXPOSE 5432
