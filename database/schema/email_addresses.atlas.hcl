table "email_addresses" {
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

  column "email_address" {
    type = varchar(255)
  }

  column "is_primary" {
    type = boolean
  }

  column "is_verified" {
    type = boolean
  }
}
