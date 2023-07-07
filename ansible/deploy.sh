#!/bin/bash

# añadir tantas líneas como sean necesarias para el correcto despligue
ansible-playbook -i inventory 01_playbook_podman.yaml
ansible-playbook -i inventory 02_playbook_aks.yaml
