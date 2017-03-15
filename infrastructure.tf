provider "docker" {
    host = "unix:///var/run/docker.sock"
}

resource "docker_container" "nginx" {
    name = "nginx"
    image = "helloworld_nginx:latest"
    links = [ "consul:consul" ]
    restart = "always"
    ports {
        internal = 80
        external = 80
    }
}

resource "docker_container" "hello" {
    name = "hello"
    image = "helloworld_hello:latest"
    links = [ "consul:consul" ]
}

resource "docker_container" "world" {
    name = "world"
    image = "helloworld_world:latest"
    links = [ "consul:consul" ]
}

resource "docker_container" "consul" {
    name = "consul"
    image = "consul:latest"
    restart = "always"
    ports {
        internal = 8500
        external = 8500
    }
}
