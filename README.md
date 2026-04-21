# Gestión de Infraestructura con Terraform

> Guía de referencia rápida para instalar, configurar y operar Terraform

---

## Instalación

**macOS**
```bash
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

**Otros sistemas operativos**
Descarga el instalador oficial según tu SO: [Guía de instalación oficial](https://developer.hashicorp.com/terraform/install)

---

## Proveedor de nube

Terraform se conecta a distintos servicios de nube (Azure, AWS, GCP, etc.) a través de **proveedores**. Cada proveedor expone los recursos que puedes crear y gestionar.

→ [Ver todos los proveedores disponibles](https://registry.terraform.io/browse/providers)

---

## Configurar un proveedor — Ejemplo: Azure

**1. Crea un archivo `main.tf`** en tu proyecto y agrega el siguiente bloque:

```hcl
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.69.0"
    }
  }
}

provider "azurerm" {
  features {} # Requerido para el funcionamiento de azurerm
}
```

**2. Descarga el proveedor** ejecutando:

```bash
terraform init
```

---

## Flujo de trabajo principal de Manejo de Infra

### 1. Inicializar el proyecto

Prepara el directorio de trabajo: descarga los proveedores y módulos necesarios. Ejecuta esto una sola vez al comenzar o al añadir nuevos proveedores.

```bash
terraform init
```

### 2. Planificar los cambios

Compara el estado actual de tu infraestructura con lo definido en tus archivos y guarda las acciones pendientes en `plan.out`. Revisa el resultado antes de aplicar.

```bash
terraform plan -out plan.out
```

### 3. Aplicar los cambios

Ejecuta el plan guardado y crea o modifica los recursos en tu proveedor de nube.

```bash
terraform apply "plan.out"
```

---

## Eliminar infraestructura

> ⚠️ **Acción irreversible.** Asegúrate de revisar qué recursos serán eliminados antes de confirmar.

### Destruir todo

Elimina permanentemente todos los recursos administrados por los archivos de configuración actuales.

```bash
terraform destroy
```

### Destruir un recurso específico

Elimina solo un recurso sin afectar el resto. Reemplaza `<nombre>` con el nombre que le diste al recurso en tu configuración.

```bash
terraform destroy -target=azurerm_resource_group.<nombre>
```

