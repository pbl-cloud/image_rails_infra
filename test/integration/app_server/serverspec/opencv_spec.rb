describe "OpenCV" do
  describe file('/usr/local/lib/libopencv_core.so') do
    it { should be_file }
  end
end
