# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace 'TCBancom'

project 'TCBancom/TCBancom.xcodeproj'

# Pods for TarjetaW
def tcbancompods
end

target 'TCBancom' do
  project 'TCBancom/TCBancom.xcodeproj'
  # Comment the next line if you don't want to use dynamic frameworks

  # Pods for TCBancom
  use_frameworks!
  tcbancompods

  target 'TCBancomTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'TCBancomUITests' do
    # Pods for testing
  end

end
