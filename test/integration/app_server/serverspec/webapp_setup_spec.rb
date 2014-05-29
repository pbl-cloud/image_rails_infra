describe "Webapp Setup" do
  describe command('su - image_rails -c env') do
    its(:stdout) { should match /SECRET_KEY_BASE=.{100}$/ }
  end

  describe file('/home/image_rails/image_rails/shared/config') do
    it { should be_directory }
  end

  describe file('/home/image_rails/image_rails/shared/config/database.yml') do
    it { should be_file }
  end

  describe file('/home/image_rails/image_rails/shared/config/settings.local.yml') do
    it { should be_file }
  end
end
