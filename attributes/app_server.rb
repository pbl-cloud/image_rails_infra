override['image_rails']['packages'] = %w{
  build-essential
  openssl
  libreadline6
  libreadline6-dev
  curl
  git-core
  zlib1g
  zlib1g-dev
  libssl-dev
  libyaml-dev
  libsqlite3-dev
  sqlite3
  libxml2-dev
  libxslt-dev
  autoconf
  libc6-dev
  ncurses-dev
  automake
  libtool
  bison
  nodejs
  subversion
}

default['image_rails']['ruby'] = "2.1.1"

default['image_rails']['user'] = "image_rails"
default['image_rails']['group'] = "image_rails"
default['image_rails']['shell'] = '/bin/bash'
default['image_rails']['user_uid'] = nil
default['image_rails']['user_gid'] = nil
default['image_rails']['home'] = "/home/image_rails"
