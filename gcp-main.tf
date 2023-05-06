# Cria uma VM no Google Cloud
resource "google_compute_instance" "firstvm" {
  name         = "helloworld"
  machine_type = "n1-standard-1"
  zone         = var.zone

  # Defini a Imagem da VM
  boot_disk {
    initialize_params {
      image = "ubuntu-2004-focal-v20230213"
    }
  }

  # Habilita rede para a VM com um IP público
  network_interface {
    network = "default" # Estamos usando a VPC default que já vem por padrão no projeto.

    access_config {
    // A presença do bloco access_config, mesmo sem argumentos, garante que a instância estará acessível pela internet.
    }
  }
}

// Cria artifact registry
resource "google_artifact_registry_repository" "my-repo" {
  location = var.region
  repository_id = "labdevops"
  description = "Imagens Docker"
  format = "DOCKER"
}

// Cria database
resource "google_sql_database_instance" "instance" {
  name             = var.db_instance
  region           = var.region
  database_version = "MYSQL_5_7"
  settings {
    tier = "db-f1-micro"
  }

  deletion_protection  = "true"
}
