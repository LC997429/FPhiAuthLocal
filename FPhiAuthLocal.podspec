#
# Be sure to run `pod lib lint FPhiAuthLocal.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FPhiAuthLocal'
  s.version          = '0.1.0'
  s.summary          = 'A short description of FPhiAuthLocal.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/LAguirreE/FPhiAuthLocal'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'LAguirreE' => 'luisaguirre@facephi.com' }
  s.source           = { :git => 'https://github.com/LAguirreE/FPhiAuthLocal.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'
  
  s.source_files        = "*.{h,m}"
  s.public_header_files = '*.h'
  s.resources = ['lib/fphi-selphi-widget-resources-selphi-live-1.2.zip']
  s.preserve_paths      = "*.js"
  s.vendored_frameworks = 'lib/FPhiWidgetSelphi.xcframework', 'lib/FPhiWidgetCore.xcframework', 'lib/FPBExtractoriOS.xcframework'
  
  s.dependency "zipzap"
  # s.resource_bundles = {
  #   'FPhiAuthLocal' => ['FPhiAuthLocal/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
