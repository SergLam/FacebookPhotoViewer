# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'
deployment_target = '11.0'

install! 'cocoapods', :disable_input_output_paths => true, :warn_for_unused_master_specs_repo => false

source 'https://github.com/CocoaPods/Specs.git'

use_frameworks!
inhibit_all_warnings!

workspace 'FBPhotoViewer'

project 'FBPhotoViewer'

def development_pods
  
  use_frameworks!
  inhibit_all_warnings!
  
  # Facebook
  pod 'FBSDKLoginKit', '~> 12.3.0'
  pod 'FBSDKCoreKit', '~> 12.3.0'
  pod 'FBSDKShareKit', '~> 12.3.0'
  
  # Networking
  pod 'SwiftyJSON', '~> 5.0.1'
  
  # UI
  pod 'Kingfisher', '~> 6.3.0'
  pod 'AlisterSwift', :git => 'https://github.com/anodamobi/AlisterSwift.git', :branch => 'develop', :commit => 'ff395f6'
  pod 'DZNEmptyDataSet', '~> 1.8.1'
  pod 'PKHUD', '~> 5.3.0'
  
  # Resources
  pod 'R.swift', '~> 6.1.0'

  # Code-style
  pod 'SwiftLint', '~> 0.46.2'
end

def testing_pods
  
  # Code-style
  pod 'SwiftLint', '~> 0.46.2'
end

abstract_target 'App' do
  
  target 'FBPhotoViewer' do
    
    project 'FBPhotoViewer'
    development_pods
    
  end
  
  target 'FBPhotoViewerTests' do
    
    project 'FBPhotoViewer'
    testing_pods
    
  end
  
  target 'FBPhotoViewerUITests' do
    
    project 'FBPhotoViewer'
    testing_pods
    
  end
  
end

post_install do |installer|
  
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO' # set 'NO' to disable DSYM uploading - usefull for third-party error logging SDK (like Firebase)
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
      if config.name == 'Debug' || config.name == 'Debug-MockAPI'
        config.build_settings['OTHER_SWIFT_FLAGS'] = ['$(inherited)', '-Onone']
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Owholemodule'
      end
    end
  end
  
  installer.generated_projects.each do |project|
    project.build_configurations.each do |bc|
      bc.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
    end
  end
  
end
