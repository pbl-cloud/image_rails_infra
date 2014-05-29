name "image_rails"
version "0.1.0"

recipe "image_rails::default", "Installation"

%w{ magic_shell locale apt ruby_build
    timezone-ii ssh-keys }.each do |dep|
  depends dep
end

%w{ debian ubuntu }.each do |os|
  supports os
end
