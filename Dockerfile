FROM postgis/postgis:16-3.4

WORKDIR /alkis_pg

COPY ./scripts/ /alkis_pg/scripts/
RUN chmod +x /alkis_pg/scripts/*.sh

COPY ./sql/ /alkis_pg/sql/

EXPOSE 5432
