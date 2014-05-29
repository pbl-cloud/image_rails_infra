describe "Nginx" do
  describe file('/etc/nginx') do
    it { should be_directory }
  end

  describe port(80) do
    it { should be_listening }
  end
end
