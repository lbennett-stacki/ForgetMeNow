# Config
#
ENV := "development"
SCHEMA_DIR := "schema"

# Database
#
db-name:
  @echo forgettable-{{ENV}}
db-url:
  @turso db show $(just db-name) --url
db-create:
  turso db create $(just db-name)
db-token:
  @turso db tokens create $(just db-name)
db-migrate:
  echo "Migrating DB..."
  cd database && \
  atlas schema apply -u "$(just db-url)?authToken=$(just db-token)" \
  --to file://{{SCHEMA_DIR}} --exclude '_litestream_seq,_litestream_lock'
  echo "Migration complete!"
db-shell:
  turso db shell $(just db-name)
db-docs:
  echo "Generating DB docs..."
  cd docs/database && \
  plantuml erd.puml && \
  open erd.png
  echo "Generation complete!"
