

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

resource "heroku_build" "default" {
  app = "${heroku_app.default.name}"
  buildpacks = ["https://github.com/heroku/heroku-buildpack-ruby.git"]
  source = {
    url = "https://github.com/MohamedTaha123/rails_heroku_terraform/archive/0.0.3.tar.gz"
    version = "0.0.3"
  }
 
}

# Launch the app's web process by scaling-up
resource "heroku_formation" "default" {
  app        = "${heroku_app.default.name}"
  type       = "web"
  quantity   = 1
  size       = "Standard-1x"
  depends_on = ["heroku_build.default"]
}

output "example_app_url" {
  value = "https://${heroku_app.default.name}.herokuapp.com"
}