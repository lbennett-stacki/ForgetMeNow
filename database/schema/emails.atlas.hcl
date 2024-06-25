table "emails" {
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

  column  "company_id" {
    type = uuid
    null = true
  }
  foreign_key "company_id" {
    columns = [column.company_id]
    ref_columns = [table.companies.column.id]
  }

  column "from_address" {
    type = varchar(255)
  }

  column "subject" {
    type = varchar(255)
  }

  column "received_date" {
    type = date
  }
}
