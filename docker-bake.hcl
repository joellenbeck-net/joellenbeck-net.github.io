variable "NAME" {
  default = "playground"
}

group "default" {
  targets = [
    "playground-ruby",
    "www"
  ]
}

target "playground-ruby" {
  context = "./playground-ruby"
  tags = [
    "ghcr.io/joellenbeck-net/${NAME}/playground-ruby" 
  ]
}

target "www" {
  context = "./www"
  tags = [
    "ghcr.io/joellenbeck-net/${NAME}/www" 
  ]
}
