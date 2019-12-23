# heroku_terraform_infra

When Terraform uses the Heroku provider, it makes requests to the Platform API to create apps, add-ons, and other resources.
Requests to the Platform API require an authorization token.

##  Obtaining a heroku authorization token

First, use the [Heroku](https://devcenter.heroku.com/articles/heroku-cli) CLI to ensure that you are logged in to the Heroku account that you want to use with Terraform:

``` 
$ heroku login
$ heroku authorizations:create --description "your_app_name"
```

Set the returned Token value and the Heroku account’s email address as local environment variables for Terraform.
```
$ export HEROKU_API_KEY=<TOKEN> HEROKU_EMAIL=<EMAIL>
```

To check if your token is well created, you can check with :
```
heroku authorizations
```
##  Initialization
```
$ terraform init
```
