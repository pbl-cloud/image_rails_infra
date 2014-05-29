describe "Users" do
  describe group('image_rails') do
    it { should exist }
  end

  describe user('image_rails') do
    it { should exist }
    it { should belong_to_group 'image_rails' }
  end

  describe file('/home/image_rails') do
    it { should be_directory }
    it { should be_owned_by 'image_rails' }
  end
end
