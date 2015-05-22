#
# Be sure to run `pod lib lint PXQSpinner.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PXQSpinner"
  s.version          = "0.3"
  s.summary          = "PXQSpinner is just another iOS activity indicator."
  s.description      = <<-DESC

The PXQSpinner allows for better flexibility and customization over the standard UIActivityIndicator view.

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/saorsa/saorsa.PXQSpinner"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Atanas Dragolov" => "atanas.dragolov@saorsa.bg" }
  s.source           = { :git => "https://github.com/saorsa/saorsa.PXQSpinner.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'PXQSpinner' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'CoreGraphics', 'QuartzCore'
  s.dependency 'PXQuisiteExtensions', '~> 0.5'
end
