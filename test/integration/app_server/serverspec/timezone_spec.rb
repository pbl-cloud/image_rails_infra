describe "Timezone" do
  describe file('/etc/timezone') do
    it { should be_file }
    its(:content) { should match "Asia/Tokyo" }
  end

  describe command('cmp /etc/localtime /usr/share/zoneinfo/Asia/Tokyo') do
    it { should return_exit_status 0 }
  end
end
