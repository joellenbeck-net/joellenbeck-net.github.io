group "default" {
  targets = [
    "playground-rb",
    "www"
  ]
}

target "playground-rb" {
  context = "playground-rb"
  tags = [
    "ghcr.io/joellenbeck-net/playground-rb" 
  ]
}

target "www" {
  context = "www"
  tags = [
    "ghcr.io/joellenbeck-net/www" 
  ]
}
