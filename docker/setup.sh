# Создайте файл setup.sh
cat > setup.sh << 'EOF'
#!/bin/bash

# Инициализация и обновление подмодулей
git submodule update --init --recursive

# Создание docker-data директорий
cd docker
./init-docker-dirs.sh
cd ..

echo "Инфраструктура инициализирована успешно!"
EOF

# Сделайте скрипт исполняемым
chmod +x setup.sh