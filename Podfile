# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'
inhibit_all_warnings!

target 'BookSeeker' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  def reusepods
      pod 'Alamofire', '~> 5.0.0-rc.2'
  end

  # Pods for BookSeeker
  reusepods
  pod 'SwiftLint', '~> 0.33'

  target 'BookSeekerTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'BookSeekerUITests' do
    inherit! :search_paths
    reusepods
  end

end
