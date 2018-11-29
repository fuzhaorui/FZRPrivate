Pod::Spec.new do |spec|
  spec.name         = 'FZRPrivate'
  spec.version      = '0.0.3'
  spec.license      = 'MIT'
  spec.summary      = 'An Swift client for the Pusher.com service'
  spec.homepage     = 'https://github.com/fuzhaorui/FZRPrivate'
  spec.author       = 'Luke Redpath'
  spec.source       = { :git => 'https://github.com/fuzhaorui/FZRPrivate.git', : tag => spec.version  }
  spec.swift_version = "4.2"
  spec.source_files = 'Source/**/*.swift'
  spec.requires_arc = true
end