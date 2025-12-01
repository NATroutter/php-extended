# PHP Extended Docker Image

A lightweight PHP FPM Alpine Docker image with extended functionality for web applications requiring MySQL connectivity, image processing, and zip file support.

## About

This Docker image provides a production-ready PHP FPM environment with essential extensions pre-installed, optimized for Alpine Linux to keep the image size minimal while providing comprehensive functionality for modern PHP applications.

## Features

- **PHP FPM** - PHP runtime on Alpine Linux
- **MySQL Support** - PDO MySQL database driver for MySQL connectivity
- **Image Processing** - GD with FreeType, libjpeg, libpng support for image manipulation
- **Zip Support** - ZIP file creation and extraction
- **Caching Layers** - Memcached and Redis for distributed caching and session storage
- **Math Support** - BCMath extension for arbitrary precision arithmetic
- **Minimal Footprint** - Alpine Linux keeps the image size lean
- **Dynamic PHP Versions** - Build with different PHP versions using build arguments

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
- `zip` - Zip file handling
- `gd` - Image manipulation with FreeType, JPEG, and PNG support
- `bcmath` - Arbitrary precision arithmetic
- `memcached` - Memcached distributed caching (PECL)
- `redis` - Redis caching and session storage (PECL)

## Building with Custom PHP Versions

The image supports building with different PHP versions:

```bash
# Build with PHP 8.4
docker build --build-arg PHP_VERSION=8.4 -t php-extended:8.4 .

# Build with PHP 8.3
docker build --build-arg PHP_VERSION=8.3 -t php-extended:8.3 .
```

The default PHP version is 8.5 if not specified.

## Quick Start

### Using Docker Run

```bash
docker run -d \
  --name php-app \
  -p 9000:9000 \
  -v ./app:/var/www/html \
  ghcr.io/natroutter/php-extended:latest
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
git clone https://github.com/natroutter/php-extended.git
cd php-extended
docker build -t php-extended:local .
```

Or build with a specific PHP version:

```bash
docker build --build-arg PHP_VERSION=8.4 -t php-extended:8.4 .
```

## Updating

To update to the latest version:

```bash
docker-compose down
docker pull ghcr.io/natroutter/php-extended:latest
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
