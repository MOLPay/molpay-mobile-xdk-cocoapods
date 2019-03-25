#
# Be sure to run `pod lib lint MOLPayXDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "MOLPayXDK"
  s.version          = "3.23.2"
  s.summary          = "MOLPay Mobile XDK"
  s.description      = "MOLPay mobile payment for iOS (Cocoapods Framework)"

  s.homepage         = "https://github.com/MOLPay/rms-mobile-xdk-cocoapods"
  s.license          = 'MIT'
  s.author           = { "MOLPay Mobile Division" => "mobile@molpay.com" }
  s.source           = { :git => "https://github.com/MOLPay/rms-mobile-xdk-cocoapods.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.public_header_files = 'Pod/Classes/**/*.h'

  s.resource = 'MOLPayXDK.bundle'
  s.vendored_frameworks = 'MOLPayXDK.framework'

end
