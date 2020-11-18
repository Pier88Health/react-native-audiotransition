
Pod::Spec.new do |s|
  s.name         = "RNAudiotransition"
  s.version      = "1.0.0"
  s.summary      = "RNAudiotransition by p88health"
  s.description  = <<-DESC
                  RNAudiotransition
                   DESC
  s.homepage     = "www.p88health.com"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNAudiotransition.git", :tag => "master" }
  s.source_files = 'ios/*.{h,m}'
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

