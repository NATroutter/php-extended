# PHP Extended Docker Image

A lightweight PHP FPM Alpine Docker image with extended functionality for web applications requiring MySQL connectivity, image processing, and zip file support.

## About

This Docker image provides a production-ready PHP FPM environment with essential extensions pre-installed, optimized for Alpine Linux to keep the image size minimal while providing comprehensive functionality for modern PHP applications.

## Features

- **PHP FPM** - PHP runtime on Alpine Linux
- **MySQL Support** - PDO MySQL, MySQLi drivers, and MySQL CLI tools
- **Image Processing** - FreeType, libjpeg, libpng support for image manipulation
- **Zip Support** - ZIP file creation and extraction
- **OpCache Enabled** - Performance optimization for PHP code
- **Minimal Footprint** - Alpine Linux keeps the image size lean

## Installed Extensions

**Pre-installed (included in base image):**
- `opcache` - PHP opcode caching
- `curl` - HTTP requests
- `mbstring` - Multibyte string functions
- `xml`, `dom`, `xmlreader`, `xmlwriter` - XML/DOM manipulation
- `ctype`, `filter` - String/input validation
- `json` - JSON handling
- `session` - Session management
- `pdo`, `pdo_sqlite` - Database abstraction and SQLite
- `zlib` - Compression

**Additionally installed:**
- `pdo_mysql` - PDO MySQL database driver
- `mysqli` - Improved MySQL extension
- `zip` - Zip file handling
- `gd` - Image manipulation (requires FreeType/libjpeg/libpng)
- `intl` - Internationalization and localization
- `memcached` - Memcached caching (PECL)
- `redis` - Redis caching (PECL)

## Installed System Packages

- `mysql-client` - MySQL command-line client
- `freetype-dev` - TrueType font support
- `libjpeg-turbo-dev` - JPEG image support
- `libpng-dev` - PNG image support
- `libzip-dev` - Zip file library

## Quick Start

### Using Docker Run

```bash
docker run -d \
  --name php-app \
  -p 9000:9000 \
  -v ./app:/var/www/html \
  ghcr.io/NATroutter/php-extended:latest
```

### Using Docker Compose

```yaml
services:
  php:
    image: ghcr.io/natroutter/php-extended:latest
    restart: unless-stopped
    ports:
      - "9000:9000"
    volumes:
      - ./app:/var/www/html
    environment:
      - TZ=UTC
```

Then run:

```bash
docker-compose up -d
```

## Configuration

The container runs PHP-FPM on port 9000 with the working directory set to `/var/www/html`. Mount your PHP application code to this location.

## Building Locally

To build the image yourself:

```bash
git clone https://github.com/NATroutter/php-extended.git
cd php-extended
docker build -t php-extended:local .
```

## Updating

To update to the latest version:

```bash
docker-compose down
docker pull ghcr.io/NATroutter/php-extended:latest
docker-compose up -d
```

## Use Cases

This image is ideal for:
- Traditional PHP web applications
- Laravel, Symfony, WordPress installations
- Applications requiring MySQL database connectivity
- Image processing and manipulation
- File upload and zip handling

## License

This Docker implementation is provided as-is under the MIT License.
