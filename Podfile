# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace 'TCBancom'

project 'TCBancom/TCBancom.xcodeproj'
project 'UIComponents/UIComponents.xcodeproj'
project 'Common/Common.xcodeproj'

# Pods for TCBancom
def tcbancompods
  pod "IQKeyboardManagerSwift"
end

# Pods for Common
def commonpods
end

def shareduicomponentspods
  pod 'ProgressHUD'
end

# Pods for UIComponents
def uicomponentspods
end

target 'TCBancom' do project 'TCBancom/TCBancom.xcodeproj'
  # Comment the next line if you don't want to use dynamic frameworks

  # Pods for TCBancom
  use_frameworks!
  tcbancompods
  shareduicomponentspods

  target 'TCBancomTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'TCBancomUITests' do
    # Pods for testing
  end

end

target 'UIComponents' do project 'UIComponents/UIComponents.xcodeproj'
  use_frameworks!
  shareduicomponentspods
  
end

target 'Common' do project 'Common/Common.xcodeproj'
  use_frameworks!
  commonpods
  
end
