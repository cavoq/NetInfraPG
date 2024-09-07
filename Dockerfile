FROM postgis/postgis:16-3.4

WORKDIR /netinfra_pg

COPY ./scripts/ /netinfra_pg/scripts/
RUN chmod +x /netinfra_pg/scripts/*.sh

COPY ./sql/ /netinfra_pg/sql/

EXPOSE 5432
