Pod::Spec.new do |s|
  s.name         = "MultiLayerNavigation"
  s.version      = "0.0.1"
  s.summary      = "Drag to go back Interaction Implementaion"
  s.homepage     = "https://github.com/myoula/MultiLayerNavigation"
  s.author       = { "myoula" => "myoula@qq.com" }
  s.platform     = :ios, '5.0'
  s.source       = { :git => "https://github.com/myoula/MultiLayerNavigation.git", :tag => "v#{s.version}" }
  s.source_files  = 'Src/*.{h,m}'
end
