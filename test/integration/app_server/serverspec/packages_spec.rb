packages = %w{
  build-essential
  libreadline6
}


packages.each do |package|
  describe package(package) do
    it { should be_installed }
  end
end
