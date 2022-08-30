#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint openpay_plugin_sdk.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'openpay_plugin_sdk'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin project.'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  public_header_files='Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '14.3'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
  s.preserve_paths = 'OpenpayKit.xcframework/**/*'
  # s.vendored_frameworks = 'OpenpayKit.xcframework/ios-arm64_x86_64-simulator/OpenpayKit.framework'
  # s.vendored_frameworks = 'OpenpayKit.xcframework/ios-arm64/OpenpayKit.framework'
  s.vendored_frameworks ='OpenpayKit.xcframework'
  
  s.xcconfig = {
    'FRAMEWORK_SEARCH_PATHS' => '"${PODS_ROOT}/../OpenpayKit.xcframework" "${PODS_ROOT}/../.symlinks/flutter/ios-release" "${PODS_CONFIGURATION_BUILD_DIR}"',
    'OTHER_LDFLAGS' => '${inherited} -framework OpenpayKit ${PODS_LIBRARIES}'
  }
end
