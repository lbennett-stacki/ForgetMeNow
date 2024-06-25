table "erasure_requests" {
  schema = schema.main

  column "id" {
    type = uuid
  }
  primary_key {
    columns = [
      column.id
    ]
  }

  column "email_id" {
    type = uuid
  }
  foreign_key "email_id" {
    columns = [column.email_id]
    ref_columns = [table.emails.column.id]
  }

  column "user_id" {
    type = uuid
  }
  foreign_key "user_id" {
    columns = [column.user_id]
    ref_columns = [table.users.column.id]
  }

  column "company_id" {
    type = uuid
  }
  foreign_key "company_id" {
    columns = [column.company_id]
    ref_columns = [table.companies.column.id]
  }

  column "request_date" {
    type = date
  }

  column "response_date" {
    type = date
    null = true
  }
}
