output "vpc_name" {
  description = "PawGuard VPC name"
  value       = google_compute_network.pawguard_vpc.name
}

output "vpc_id" {
  description = "PawGuard VPC ID"
  value       = google_compute_network.pawguard_vpc.id
}

output "app_subnet_name" {
  description = "PawGuard application subnet"
  value       = google_compute_subnetwork.pawguard_app_subnet.name
}

output "app_subnet_cidr" {
  description = "PawGuard application subnet CIDR"
  value       = google_compute_subnetwork.pawguard_app_subnet.ip_cidr_range
}
