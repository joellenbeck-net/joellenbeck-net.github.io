group "default" {
  targets = [
    "playground-ruby",
    "www"
  ]
}

target "playground-ruby" {
  context = "./playground-ruby"
  tags = [
    "ghcr.io/joellenbeck-net/playground-ruby" 
  ]
}

target "www" {
  context = "./www"
  tags = [
    "ghcr.io/joellenbeck-net/www" 
  ]
}
