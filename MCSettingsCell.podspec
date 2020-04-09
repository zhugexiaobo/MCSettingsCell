#
# Be sure to run `pod lib lint MCSettingsCell.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MCSettingsCell'
  s.version          = '0.1.0'
  s.summary          = 'Easy to create common types of setting table cell.'

  s.homepage         = 'https://github.com/zhugexiaobo/MCSettingsCell'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'zhugexiaobo' => 'zhugexiaobo@gmail.com' }
  s.source           = { :git => 'https://github.com/zhugexiaobo/MCSettingsCell.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'MCSettingsCell/Classes/**/*'

end
