#
# Be sure to run `pod lib lint AFULoginSDK.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "AFULoginSDK"
  s.version          = "0.1.0"
  s.summary          = "AFULoginSDK - обертка вокруг uLogin SDK для iOS. https://github.com/ulogin/iOS"
  s.homepage         = "https://github.com/alexfedosov/AFULoginSDK"
  s.license          = 'MIT'
  s.author           = { "Alexander Fedosov" => "alexander.a.fedosov@gmail.com" }
  s.source           = { :git => "https://github.com/alexfedosov/AFULoginSDK.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'AFULoginSDK' => ['Pod/Assets/**/*.storyboard']
  }

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.dependency 'SVProgressHUD'
end
