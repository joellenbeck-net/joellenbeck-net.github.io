group "default" {
  targets = [
    "jekyll",
    "ruby"
  ]
}

target "jekyll" {
  context = "jekyll"
  tags = [
    "ghcr.io/joellenbeck-net/jekyll" 
  ]
}

target "ruby" {
  context = "ruby"
  tags = [
    "ghcr.io/joellenbeck-net/ruby" 
  ]
}
