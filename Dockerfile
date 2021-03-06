FROM soxueren/osm-website:base

RUN cd /openstreetmap-website/db/functions && \
        make libpgosm.so && \
        cd ../..

ENV PGDATABASE osm
ENV PGPASSWORD 123456
ENV POSTGRES_USER postgres
ENV PG_HOST localhost

ADD postgresql/database.yml /openstreetmap-website/config/database.yml

ADD extensions.sql /openstreetmap-website/db/extensions.sql

ADD docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["bash","/docker-entrypoint.sh"]

CMD ["bash"]
