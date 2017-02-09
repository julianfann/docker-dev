FROM php:7-fpm

# RUN apt-get update && apt-get install -y \
#     libmagickwand-6.q16-dev --no-install-recommends \
#     #&& mv /usr/bin/MagickWand-config /usr/bin/MagickWand-config-bak \
#     #&& ln -s /usr/lib/x86_64-linux-gnu/ImageMagick-6.8.9/bin-Q16/MagickWand-config /usr/bin \
#     && pecl install imagick-beta \
#     && echo "extension=imagick.so" > /usr/local/etc/php/conf.d/ext-imagick.ini

RUN apt-get update && apt-get install -y \
    libmcrypt-dev

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install zip

CMD ["php-fpm"]