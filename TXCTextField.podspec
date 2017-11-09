Pod::Spec.new do |s|
  s.name         = 'TXCTextField'
  s.version      = '0.0.2'
  s.summary      = '只需简单操作即可监听TextField输入,监听第一相应事件,改变描述颜色以及对齐方式等功能。'
  s.description  = <<-DESC
			只需简单操作即可监听TextField输入,监听第一相应事件,改变描述颜色以及对齐方式等功能。重构项目结构、新增光标起始位置、和系统高度保持一致等。
                   DESC
  s.homepage     = 'https://github.com/xtzPioneer/TXCTextField'
  s.license      = 'MIT'
  s.author       = { 'zhangxiong' => 'xtz_pioneer@163.com' }
  s.platform     = :ios, '8.0'
  s.source       = { :git => 'https://github.com/xtzPioneer/TXCTextField.git', :tag => s.version.to_s }
  s.source_files = 'TXCTextField/**/*.{h,m}'
  s.requires_arc = true  
end