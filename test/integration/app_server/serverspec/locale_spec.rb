describe "Locale" do
  describe command('echo $LANG') do
    it { should return_stdout 'en_US.utf8' }
  end
end
