

provider "heroku" {
  version = "~> 2.2.1"
}
variable "rails_app" {
  description = "rails web application"
}

resource "heroku_app" "default" {
  name   = "${var.rails_app}"
  region = "us"
   buildpacks = [
    "heroku/ruby"
  ]
}