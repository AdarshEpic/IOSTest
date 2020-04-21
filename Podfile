# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'IOSTest' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  inhibit_all_warnings!
  # Autolayout Framework
  pod 'Masonry', '1.1.0'
  # Style Formatter Framework
  pod 'SwiftLint', '0.39.2'
  # Reachabily Framework
  pod 'ReachabilitySwift', '5.0.0'
  # Toast
  pod 'KSToastView', '0.5.7'
  
  # Pods for IOSTest

  target 'IOSTestTests' do
    inherit! :search_paths
  end

  target 'IOSTestUITests' do
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['GCC_WARN_INHIBIT_ALL_WARNINGS'] = "YES"
        end
    end
end
