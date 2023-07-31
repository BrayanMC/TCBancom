# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

workspace 'TCBancom'

project 'TCBancom/TCBancom.xcodeproj'
project 'UIComponents/UIComponents.xcodeproj'
project 'Common/Common.xcodeproj'
project 'Data/Data.xcodeproj'
project 'Domain/Domain.xcodeproj'

# Pods for TCBancom
def tcbancompods
  pod "IQKeyboardManagerSwift"
  pod 'lottie-ios'
end

def sharedpods
  pod 'SwiftKeychainWrapper'
end

# Pods for Common
def commonpods
end

# Pods for Data
def datapods
  pod 'Alamofire', '~> 5.5'
  pod 'ReachabilitySwift', '4.3.1'
end

def shareddatapods
  pod 'PromiseKit', '~> 6.8'
end

# Pods for Domain
def domainpods
end

def shareduicomponentspods
  pod 'ProgressHUD'
  pod 'SkeletonView', '~> 1.8.7'
end

# Pods for UIComponents
def uicomponentspods
end

target 'TCBancom' do project 'TCBancom/TCBancom.xcodeproj'
  # Comment the next line if you don't want to use dynamic frameworks

  # Pods for TCBancom
  use_frameworks!
  tcbancompods
  sharedpods
  shareduicomponentspods
  datapods
  shareddatapods

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

target 'Data' do project 'Data/Data.xcodeproj'
  use_frameworks!
  datapods
  shareddatapods
  sharedpods
  
end

target 'Domain' do project 'Domain/Domain.xcodeproj'
  use_frameworks!
  domainpods
  shareddatapods
  
end

post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                  config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
               end
          end
   end
end

