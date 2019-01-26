Pod::Spec.new do |s|
  s.name             = 'Outfit'
  s.version          = '0.1.0'
  s.summary          = 'Composable outfit for your UIKit elements'
  
  s.description      = <<-DESC
    Easy UIKit elements styling using functional composition.
  DESC
  
  s.homepage         = 'https://github.com/fuzza/Outfit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fuzza' => 'alex.fuzza@gmail.com' }
  s.source           = { :git => 'https://github.com/fuzza/Outfit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
  s.ios.deployment_target = '9.0'
  s.swift_version = '4.2'
  s.default_subspec = 'All'
  
  s.subspec 'All' do |all|
    all.dependency 'Outfit/Core'
    all.dependency 'Outfit/UI'
  end
  
  s.subspec 'Core' do |core|
    core.source_files = 'Outfit/Core/**/*'
  end
  
  s.subspec 'UI' do |ui|
    ui.source_files = 'Outfit/UIKit/**/*'
    ui.frameworks = 'UIKit'
    ui.dependency 'Outfit/Core'
  end
end
