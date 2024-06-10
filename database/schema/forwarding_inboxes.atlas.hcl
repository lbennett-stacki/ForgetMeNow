table "forwarding_inboxes" {
  schema = schema.main

  column "id" {
    type = uuid
  }
  primary_key {
    columns = [
      column.id
    ]
  }

  column "user_id" {
    type = uuid
  }
  foreign_key "user_id" {
    columns = [column.user_id]
    ref_columns = [table.users.column.id]
  }

  column "custom_address" {
    type = varchar(255)
  }
}
