group "default" {
  targets = [
    "playground-rb",
    "www"
  ]
}

target "playground-rb" {
  context = "playground-rb"
  contexts = {
    ruby = "target:ruby"
  }
  tags = [
    "ghcr.io/joellenbeck-net/playground-rb" 
  ]
}

target "ruby" {
  context = "ruby"
  tags = [
    "ghcr.io/joellenbeck-net/ruby" 
  ]
}

target "www" {
  context = "www"
  contexts = {
    ruby = "target:ruby"
  }
  tags = [
    "ghcr.io/joellenbeck-net/www" 
  ]
}
