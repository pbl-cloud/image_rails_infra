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
  unzip
  cmake
}

default['image_rails']['ruby'] = "2.1.1"

default['image_rails']['user'] = "image_rails"
default['image_rails']['group'] = "image_rails"
default['image_rails']['shell'] = '/bin/bash'
default['image_rails']['user_uid'] = nil
default['image_rails']['user_gid'] = nil
default['image_rails']['home'] = "/home/image_rails"

opencv_version = "2.4.9"
default['image_rails']['opencv_version'] = opencv_version
default['image_rails']['opencv_url'] = "http://downloads.sourceforge.net/project/opencvlibrary/opencv-unix/#{opencv_version}/opencv-#{opencv_version}.zip"

default[:ssh_keys] = {
  "image_rails" => ["daniel"]
}
