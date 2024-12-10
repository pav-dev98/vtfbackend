# Usa la imagen base de Ruby con Alpine Linux
FROM ruby:3.3.6-alpine

# Establecer directorio de trabajo
WORKDIR /vtfbackend

# Instalar dependencias del sistema
RUN apk add --no-cache \
    build-base \
    curl \
    git \
    libc6-compat \
    libffi-dev \
    libxml2-dev \
    libxslt-dev \
    libtool \
    postgresql-dev \
    readline-dev \
    tzdata \
    zlib-dev

# Instalar Bundler (puedes ajustar la versión según lo necesario)
RUN gem install bundler

# Copiar Gemfile y Gemfile.lock al contenedor
COPY Gemfile Gemfile.lock ./

# Instalar dependencias de Ruby
RUN bundle install

# Copiar el código de la aplicación
COPY . .

# Configurar el puerto
EXPOSE 3000

# Comando de inicio
# CMD ["rails", "server", "-b", "0.0.0.0"]