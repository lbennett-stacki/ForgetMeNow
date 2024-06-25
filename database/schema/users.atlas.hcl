table "users" {
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

  column "should_auto_complain" {
    type = boolean
  }
}
