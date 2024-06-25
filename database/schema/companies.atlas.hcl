table "companies" {
  schema = schema.main

  column "id" {
    type = uuid
  }
  primary_key {
    columns = [
      column.id
    ]
  }

  column "name" {
    type = varchar(255)
  }

  column "email" {
    type = varchar(255)
  }

  column "forgetfulness_score" {
    type = int
  }

  column "average_response_time_minutes" {
    type = int
    null = true
  }

  column "average_forget_time_minutes" {
    type = int
    null = true
  }
}
