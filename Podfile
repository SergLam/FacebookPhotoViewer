# Uncomment the next line to define a global platform for your project
platform :ios, '15.0'
deployment_target = '15.0'

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
  pod 'FBSDKLoginKit', '~> 16.1.0'
  pod 'FBSDKCoreKit', '~> 16.1.0'
  pod 'FBSDKShareKit', '~> 16.1.0'
  
  # Networking
  pod 'Kingfisher', '~> 7.7.0'

  # Code-style
  pod 'SwiftLint', '~> 0.52.2'
end

def testing_pods
  
  # Code-style
  pod 'SwiftLint', '~> 0.52.2'
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
