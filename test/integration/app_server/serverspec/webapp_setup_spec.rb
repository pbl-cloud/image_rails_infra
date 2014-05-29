describe "Webapp Setup" do
  describe file('/home/image_rails/image_rails/shared/config') do
    it { should be_directory }
  end

  describe file('/home/image_rails/image_rails/shared/config/database.yml') do
    it { should be_file }
  end

  describe file('/home/image_rails/image_rails/shared/config/secrets.yml') do
    it { should be_file }
  end

  describe file('/home/image_rails/image_rails/shared/config/settings.local.yml') do
    it { should be_file }
  end
end
