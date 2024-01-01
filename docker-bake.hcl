group "default" {
  targets = [
    "dev"
  ]
}

target "dev" {
  context = "."
  tags = [
    "ghcr.io/joellenbeck-net/dev" 
  ]
}
