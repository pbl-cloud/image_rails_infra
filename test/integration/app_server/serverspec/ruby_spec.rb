describe "Ruby" do
  describe command('ruby --version') do
    it { should return_exit_status 0 }
    it { should return_stdout /.*2.1.1.*/ }
  end

  describe command('bundle --version') do
    it { should return_exit_status 0 }
  end
end
