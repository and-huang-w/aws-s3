variable "bucket_name" {
  default = "bucket_name"
  type    = string

  validation {
    condition = (
      length(var.bucket_name) >= 3 && length(var.bucket_name) <= 63 &&                       # Comprimento entre 3 e 63 caracteres
      can(regex("^[a-z0-9.-]+$", var.bucket_name)) &&                                        # Apenas letras minúsculas, números, pontos e hífens
      can(regex("^[a-z0-9].*[a-z0-9]$", var.bucket_name)) &&                                 # Deve iniciar e terminar com letra ou número
      !can(regex("^[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}$", var.bucket_name)) && # Não pode parecer endereço IP (4 grupos de 1-3 dígitos separados por pontos)
      !can(regex("\\.-|-\\.", var.bucket_name)) &&                                           # Não pode ter hífen imediatamente antes ou depois de ponto
      !can(regex("\\.\\.", var.bucket_name)) &&                                              # Não pode ter pontos consecutivos
      !can(regex("--", var.bucket_name))                                                     # Não pode ter hífens consecutivos
    )
    error_message = <<-EOT
      O nome do bucket S3 deve seguir as regras da AWS:
      - Entre 3 e 63 caracteres
      - Apenas letras minúsculas (a-z), números (0-9), pontos (.) e hífens (-)
      - Deve iniciar e terminar com letra ou número
      - Não pode parecer um endereço IP (ex: 192.168.1.1)
      - Não pode ter hífen antes/depois de ponto (ex: my-.bucket)
      - Não pode ter pontos ou hífens consecutivos
      - Não pode conter underscores, maiúsculas ou caracteres especiais
    EOT
  }
}