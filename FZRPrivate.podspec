#
#  Be sure to run `pod spec lint FZRPrivate.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#  (请确保运行“pod spec lint FZRPrivate.podspec”，以确保这是一个有效的规范，并在提交规范之前删除包括该规范在内
#  的所有注释。)
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  (要了解更多关于Podspec属性的信息，请参阅 http://docs.cocoapods.org/specification.html)
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#  (要查看CocoaPods repo中的工作Podspecs，请参阅 https://github.com/CocoaPods/Specs/)
#

Pod::Spec.new do |s|

  #名称，pod search 搜索的关键词,注意这里一定要和.podspec的名称一样,否则报错
  s.name         = "FZRPrivate"
  
  #版本号
  s.version      = "0.0.3"
  
  #支持的pod最低版本
  s.platform     = :ios, '8.0'
  
  #简介
  s.summary      = "这是快速集成"
  
  #项目主页地址
  s.homepage     = "https://github.com/fuzhaorui/FZRPrivate"
  
  #社交网址,这里我写的微博默认是百度,如果你写的是你自己的博客的话,你的podspec发布成功后会@你
  s.social_media_url = 'https://github.com/fuzhaorui'
  
  #许可证
  s.license      = "Apache License 2.0"
  
  #作者
  s.author       = { "fuzhaorui" => "595878709@qq.com" }
  
  #项目的地址
  s.source       = { :git => "https://github.com/fuzhaorui/FZRPrivate.git", :tag => s.version }
  
  #是否支持ARC
  s.requires_arc = true
  
  #依赖库
  #s.description  = 'HandyJSON'
  
  #swift
  s.swift_version = "4.2"
  
  
  s.source_files  = "Source/**/*"
 
  
end
