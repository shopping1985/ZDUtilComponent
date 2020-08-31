#
# Be sure to run `pod lib lint ZDUtilComponent.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZDUtilComponent'
  s.version          = '1.0.5'
  s.summary          = 'A short description of ZDUtilComponent.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/shopping1985/ZDUtilComponent'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shopping1985' => '285624489@qq.com' }
  s.source           = { :git => 'https://github.com/shopping1985/ZDUtilComponent.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.source_files = 'ZDUtilComponent/Classes/*'
  s.public_header_files = 'ZDUtilComponent/Classes/ZDUtilComponent.h'
  #---文件分级---#
  s.subspec 'Categories' do |ss|
      ss.source_files = 'ZDUtilComponent/Classes/Categories/*'
  end
  s.subspec 'Helpers' do |ss|
      ss.source_files = 'ZDUtilComponent/Classes/Helpers/*'
  end
  # s.resource_bundles = {
  #   'ZDUtilComponent' => ['ZDUtilComponent/Assets/*.png']
  # }

  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.prefix_header_contents = '#import <objc/message.h>'
end
