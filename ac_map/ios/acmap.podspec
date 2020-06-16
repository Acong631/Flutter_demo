#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint acmap.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'acmap'
  s.version          = '0.0.1'
  s.summary          = 'A new map Flutter plugin.'
  s.description      = <<-DESC
A new map Flutter plugin.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

#  s.dependency 'BaiduMapKit'
#  #引入本地的包  
  s.vendored_frameworks = 'Frameworks/*.framework'
  s.vendored_libraries = 'Frameworks/thirdlibs/*.a'
  s.resources = 'Resources/*.bundle'
  
  # #xcode 系统依赖的frameworks
  s.frameworks = 'CoreGraphics','CoreLocation','CoreMotion','CoreTelephony','MobileCoreServices','OpenGLES','QuartzCore','Security','SystemConfiguration'
  s.libraries = 'c++','sqlite3.0','z'
  

  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice. Only x86_64 simulators are supported.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
