# Użyj oficjalnego obrazu Ubuntu jako obrazu bazowego
FROM ubuntu:latest

# Zaktualizuj listę pakietów i zainstaluj Apache
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# Skopiuj zawartość lokalnego katalogu na serwer webowy do katalogu /var/www/html
COPY . /var/www/html/

# Udostępnij port 80 dla ruchu HTTP
EXPOSE :500:80

# Uruchom Apache w trybie pierwszoplanowym, aby kontener pozostał uruchomiony
CMD ["apachectl", "-D", "FOREGROUND"]

