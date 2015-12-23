Pod::Spec.new do |spec|
  spec.name              = 'ReduxKitReactiveCocoa'
  spec.version           = '0.1.0'
  spec.summary           = 'ReactiveCocoa bindings for ReduxKit'
  spec.homepage          = 'https://github.com/ReduxKit/ReduxKitReactiveCocoa'
  spec.license           = { :type => 'MIT', :file => 'LICENSE' }
  spec.authors           = { 'Aleksander Herforth Rendtslev' => 'kontakt@karemedia.dk', 'Karl Bowden' => 'karl@karlbowden.com' }
  spec.source            = { :git => 'https://github.com/ReduxKit/ReduxKitReactiveCocoa.git', :tag => spec.version.to_s }
  spec.source_files      = 'ReduxKitReactiveCocoa'
  spec.dependency          'ReduxKit', '~> 0.1'
  spec.dependency          'ReactiveCocoa', '~> 4.0'
  spec.ios.deployment_target     = '8.0'
  spec.osx.deployment_target     = '10.10'
  #spec.tvos.deployment_target    = '9.0'
  #spec.watchos.deployment_target = '2.0'
end
