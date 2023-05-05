
//  sets up docker information
provider "docker" {
  host    = "npipe:////.//pipe//docker_engine" 
}


provider "digitalocean" {
  DIGITALOCEAN_ACCESS_TOKEN = secrets.DIGITALOCEAN_ACCESS_TOKEN # "dop_v1_a810767802ecc12ecb3bc2b2e209d5ac02bb7185a7d1b92ed84f683b7cd52e94"
}