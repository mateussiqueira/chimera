#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint iterable.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'iterable'
  s.version          = '0.0.1'
  s.summary          = 'Iterable OPX'
  s.description      = <<-DESC
Iterable handler
                       DESC
  s.homepage         = 'https://grupoq.io/'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Grupo Q' => 'contato@grupoq.io' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'Iterable-iOS-SDK', '6.4.9'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
