Pod::Spec.new do |s|
  s.name         = 'TXCTextField'
  s.version      = '0.0.2'
  s.summary      = '只需简单操作即可改变描述颜色以及位置等。重构项目结构、新增光标起始位置、和系统高度保持一致等'
  s.description  = <<-DESC
			只需简单操作即可改变描述颜色以及位置等。
                   DESC
  s.homepage     = 'https://github.com/xtzPioneer/TXCTextField'
  s.license      = 'MIT'
  s.author       = { 'zhangxiong' => 'xtz_pioneer@163.com' }
  s.platform     = :ios, '8.0'
  s.source       = { :git => 'https://github.com/xtzPioneer/TXCTextField.git', :tag => s.version.to_s }
  s.source_files = 'TXCTextField/**/*.{h,m}'
  s.requires_arc = true  
end