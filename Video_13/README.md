# Implementando Workspaces en Terraform

Hoy vamos a ver como hacer uso de los workspaces de Terraform para segregar tus despliegues basado en tus entornos de desarrollo.

![Terraform_Video_13.png](img%2FTerraform_Video_13.png)

**Video:**

0:00 Inicio

0:06 Intro

0:17 Descripción

0:30 DEMO

5:37 Código

10:34 Pasamos a la acción

18:25 Conclusión

18:48 OUTRO


GitHub:
https://github.com/TheAutomationRules/terraform/blob/main/Video_13/README.md

Twitter: @TheAutomaRules
Instagram: TheAutomationRules

#hashicorp #terraform #workspace #environment

---

Podemos comprobar las opciones de workspace de terraform.

````
terraform workspace
````

Comprobamos si existe un workspace creado.

````
terraform workspace list
````

Por defecto en un proyecto de Terraform no existe ningun workspace creado, para ello tenemos que inicializar el proyecto:

````
terraform init
````

Si ahora repetimos el comando podemos ver que se ha creado el workspace default.

````
terraform workspace list
````

El output que obtenemos es algo como esto:

````
❯ terraform workspace list
* default
````

Para crear nuevos workspaces hacemos lo siguiente.

````
terraform workspace new demo
````

Si repetimos el comando para listar (terraform workspace list) nos devolvera lo siguiente.

````
❯ terraform workspace list 
default
* demo
````

Esto nos indica que ha creado el workspace con el nombre demo y nos ha hecho un switch hacia el marcandolo como workspace seleccionado.

Ahora desde aqui podemos hacer un terraform plan y un terraform apply --auto-approve y con esto estariamos desplegando la infraestructura haciendo uso del workspace demo.

Continua con el video hasta el final, regalame un me gusta, dejame un comentario y **SUBCRIBETE!** para ayudarme a hacer mas contenido interesante!

- **The Automation Rules** 🤖👍