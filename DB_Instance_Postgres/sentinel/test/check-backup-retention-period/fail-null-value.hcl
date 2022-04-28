module "tfplan-functions" {
  source = "../../common-functions/tfplan-functions/tfplan-functions.sentinel"
}
mock "tfplan/v2" {
  module {
    source = "mock-tfplan-fail-null.sentinel"
  }
}
mock "tfrun" {
  module {
    source = "mock-tfrun.sentinel"
  }
}
test {
  rules = {
    main = false
  }
}
