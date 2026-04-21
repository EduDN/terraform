# Gestión de Infraestructura con Terraform

Comandos básicos para inicializar, aplicar y destruir la infraestructura gestionada con Terraform.

---

## Instalación 

[Instalación dependiendo tu SO](https://developer.hashicorp.com/terraform/install)

Mac
```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

## Inicializar y Aplicar Cambios con Terraform

### 1. Inicializar el repositorio
Prepara el directorio de trabajo, descargando los *providers* (proveedores) y módulos necesarios para la creación de la infraestructura.

```bash
terraform init
```

### 2. Guardar la configuración (Planificar)
Evalúa el estado actual, determina qué acciones son necesarias para alcanzar el estado deseado y guarda esta configuración en un archivo de salida llamado plan.out.

```bash
terraform plan -out plan.out
```

### 3. Desplegar la infraestructura
Aplica los cambios basándose en el plan previamente guardado. Esto creará o modificará los recursos en tu proveedor de nube.

```bash
terraform apply "plan.out"
```

## Eliminar todos los recursos
Destruye de forma permanente toda la infraestructura que está siendo administrada por los archivos de configuración actuales.

```bash
terraform destroy
```

## Eliminar un recurso en específico
Si necesitas eliminar solo un recurso en particular sin afectar el resto de tu infraestructura (por ejemplo, un grupo de recursos en Azure), utiliza el parámetro -target.


```bash
terraform destroy -target=azurerm_resource_group.<nombre_que_diste_a_tu_recurso>
```
