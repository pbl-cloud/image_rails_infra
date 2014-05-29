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

  describe file('/home/image_rails/.profile') do
    it { should be_file }
    it { should contain '$HOME/.profile.d'}
  end

  describe file('/home/image_rails/.ssh/authorized_keys') do
    it { should be_file }
    it { should contain 'daniel'}
  end
end
