# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'
deployment_target = '11.0'

install! 'cocoapods', :disable_input_output_paths => true, :warn_for_unused_master_specs_repo => false

target 'fbphotoviewer' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!
  
  # Facebook
  pod 'FBSDKLoginKit', '~> 9.2.0'
  pod 'FBSDKCoreKit', '~> 9.2.0'
  pod 'FBSDKShareKit', '~> 9.2.0'
  
  # Networking
  pod 'SwiftyJSON', '~> 5.0.1'
  
  # UI
  pod 'SnapKit', '~> 5.0.0'
  pod 'Closures', '~> 0.7'
  pod 'Kingfisher', '~> 6.3.0'
  pod 'AlisterSwift', :git => 'https://github.com/anodamobi/AlisterSwift.git', :branch => 'develop', :commit => 'ff395f6'
  pod 'DZNEmptyDataSet', '~> 1.8.1'
  pod 'PKHUD', '~> 5.3.0'
  
  # Resources
  pod 'R.swift', '~> 5.4.0'

  # Code-style
  pod 'SwiftLint', '~> 0.43.1'
  
  target 'fbphotoviewerTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'fbphotoviewerUITests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  post_install do |installer|
    
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['ENABLE_BITCODE'] = 'NO' # set 'NO' to disable DSYM uploading - usefull for third-party error logging SDK (like Firebase)
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
        config.build_settings['SWIFT_OPTIMIZATION_LEVEL'] = '-Onone'
      end
    end
    
    installer.generated_projects.each do |project|
      project.build_configurations.each do |bc|
        bc.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = deployment_target
      end
    end
    
  end

end
