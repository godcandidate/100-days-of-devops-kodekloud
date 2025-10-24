# Docker image for php-httpd
resource "docker_image" "php-httpd-image" {
  name = "php-httpd:challenge"
  build {
    path  = "${path.module}/lamp_stack/php_httpd"
    label = {
      challenge = "second"
    }
  }
}

# Docker image for mariadb
resource "docker_image" "mariadb-image" {
  name = "mariadb:challenge"
  build {
    path  = "${path.module}/lamp_stack/custom_db"
    label = {
      challenge = "second"
    }
  }
}

# Docker volume for MariaDB
resource "docker_volume" "mariadb_volume" {
  name = "mariadb-volume"
}

# Docker network (required for container attachment)
resource "docker_network" "my_network" {
  name = "my_network"
}

# MariaDB Container
resource "docker_container" "mariadb" {
  name     = "db"
  image    = docker_image.mariadb-image.name  # Use built image reference
  hostname = "db"

  # Attach to network
  networks_advanced {
    name = docker_network.my_network.name
  }

  # Port mapping
  ports {
    internal = 3306
    external = 3306
    ip       = "0.0.0.0"
  }

  labels {
    label = "challenge"
    value = "second"
  }

  # Environment variables
  env = [
    "MYSQL_ROOT_PASSWORD=1234",
    "MYSQL_DATABASE=simple-website"
  ]

  # Volume mount
  mounts {
    target = "/var/lib/mysql"
    source = docker_volume.mariadb_volume.name
    type   = "volume"
  }
}

# phpMyAdmin Container
resource "docker_container" "phpmyadmin" {
  name     = "db_dashboard"
  image    = "phpmyadmin/phpmyadmin"
  hostname = "phpmyadmin"

  # Attach to same network
  networks_advanced {
    name = docker_network.my_network.name
  }

  # Port mapping
  ports {
    internal = 80
    external = 8081
    ip       = "0.0.0.0"
  }

  # Labels
   labels {
    label = "challenge"
    value = "second"
  }

  depends_on = [
    docker_container.mariadb
  ]
}

# PHP-HTTPD Web Server Container
resource "docker_container" "php-httpd" {
  name     = "webserver"
  hostname = "php-httpd"
  image    = docker_image.php-httpd-image.name

  networks_advanced {
    name = docker_network.my_network.name
  }

  ports {
    internal = 80
    external = 80
    ip       = "0.0.0.0"
  }

  labels {
    label = "challenge"
    value = "second"
  }

  volumes {
    host_path      = "/root/code/terraform-challenges/challenge2/lamp_stack/website_content/"
    container_path = "/var/www/html"
  }

  depends_on = [
    docker_container.mariadb
  ]
}