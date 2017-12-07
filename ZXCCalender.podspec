@version = "1.0.3"

Pod::Spec.new do |s|
  s.name          = "ZXCCalender"
  s.version       = @version
  s.summary       = "日历农历法定节假日"
  s.description   = "快速集成日历,新手练习，简单日历"
  s.homepage      = "https://github.com/xicaiZhou/ZXCCalender"
  s.license       = { :type => "MIT", :file => "LICENSE" }
  s.author        = { "ZXC" => "zhouxicaijob@163.com" }
  s.ios.deployment_target   = "8.0"
  s.source        = { :git => "https://github.com/xicaiZhou/ZXCCalender.git", :tag => "v#{s.version}" }
  s.resources    = "ZXCCalender/*.{png,bundle}"
  s.source_files  = "ZXCCalender/*.{h,m}"
  s.requires_arc  = true
  s.framework     = "UIKit"
end
