table "complaints" {
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

  column "company_id" {
    type = uuid
  }
  foreign_key "company_id" {
    columns = [column.company_id]
    ref_columns = [table.companies.column.id]
  }

  column "erasure_request_id" {
    type = uuid
  }
  foreign_key "erasure_request_id" {
    columns = [column.erasure_request_id]
    ref_columns = [table.erasure_requests.column.id]
  }

  column "complaint_date" {
    type = date
  }

  column "status" {
    type = varchar(50)
  }
}
