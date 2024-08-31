FROM postgres:16.4

WORKDIR /alkis_pg

COPY ./scripts/ /alkis_pg/scripts/
RUN chmod +x /alkis_pg/scripts/*.sh

COPY ./sql/init/ /docker-entrypoint-initdb.d/

EXPOSE 5432
