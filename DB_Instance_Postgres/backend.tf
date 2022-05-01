terraform {
  cloud {
    organization = "wycombtech"

    workspaces {
      name = "rds_db_instance"
    }
  }
}