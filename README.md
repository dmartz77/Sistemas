# 📘 Playbooks de Ansible - Sistemas (RHEL 9)

Este repositorio contiene una colección de playbooks de Ansible diseñados para ejecutar tareas administrativas comunes en sistemas Red Hat Enterprise Linux 9. Todos los playbooks están listos para ejecutarse contra el `localhost` utilizando el modo `local`.

---

## ✅ Requisitos

- Ansible instalado.
- Permisos de root para ejecutar `execute_root_command.yml`.
- Inventario que apunte a `localhost` si se ejecuta en modo local.

---

## 📌 Notas

- Todos los playbooks están diseñados para ser utilizados en entornos de prueba y diagnóstico.
- Puedes adaptar estos scripts a tu inventario habitual eliminando el uso del modo local (`-c local`).

---


## 📜 Playbook: `execute_root_command.yml`

### Descripción

Este playbook permite ejecutar un **comando como root** en el sistema remoto (o local), pasando el comando mediante una variable extra (`--extra-vars`).

### Parámetro requerido

- `comando_a_ejecutar`: El comando del sistema que se desea ejecutar.

### Ejemplo de uso

```bash
ansible-playbook execute_root_command.yml -i localhost, -c local -e "comando_a_ejecutar='uptime'"
```

---

## 📜 Playbook: `verificar_ipv6.yml`

### Descripción

Este playbook **verifica si IPv6 está habilitado o deshabilitado** en el sistema consultando directamente el contenido del archivo:

```
/proc/sys/net/ipv6/conf/all/disable_ipv6
```

La salida indicará el estado de IPv6 junto con el nombre del host.

### Ejemplo de uso

```bash
ansible-playbook verificar_ipv6.yml -i localhost, -c local
```

---

## 📜 Playbook: `verificar_puertos.yml`

### Descripción

Este playbook **verifica si los puertos TCP especificados están abiertos** en el sistema. Por defecto, revisa los puertos `22`, `80` y `443`. Solo admite el protocolo TCP debido a las limitaciones del módulo `wait_for`.

### Variables disponibles

- `puertos_objetivo` (opcional): Lista de puertos a verificar. Ejemplo: `[8080, 3306]`
- `protocolo_objetivo` (opcional): Debe ser `"tcp"` (valor por defecto).

### Ejemplo de uso (puertos por defecto)

```bash
ansible-playbook verificar_puertos.yml -i localhost, -c local
```

### Ejemplo de uso con puertos personalizados

```bash
ansible-playbook verificar_puertos.yml -i localhost, -c local -e "puertos_objetivo=[8080,3306]"
```

---


© 2025 - Playbooks desarrollados para sistemas RHEL9 por **David Martínez**
