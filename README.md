
# Ansible_apache2

Este playbook de Ansible está diseñado para instalar y configurar el servidor web Apache2 en un conjunto de servidores Linux. Además, incluye un script para realizar copias de seguridad automatizadas.

## Instalación

### 1. Instalar Ansible en el controlador

Para instalar Ansible en la máquina que actuará como controlador, ejecuta el siguiente comando:

```bash
pip3 install ansible
```

### 2. Copiar la clave pública a los servidores

Asegúrate de que tu clave pública esté copiada en todos los servidores remotos para permitir la autenticación sin contraseña:

```bash
ssh-copy-id usuario_remoto@ip_remoto1
ssh-copy-id usuario_remoto@ip_remoto2
```

### 3. Clonar el repositorio

Descarga el repositorio con el siguiente comando:

```bash
git clone https://github.com/luirro777/ansible_nginx.git
cd ansible_nginx
```

### 4. Configuración

Modifica los archivos `inventory.ini` y `group_vars/webservers.yml` para adaptarlos a tus necesidades específicas.

### 5. Ejecutar el playbook

Ejecuta el playbook para instalar Nginx y configurar los backups automatizados:

```bash
./install.sh
```

## Contacto

Para cualquier consulta o soporte, por favor contacta a:

Luis Romano  
[Correo Electrónico](mailto:luisromano@gmail.com)

