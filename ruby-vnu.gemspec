Gem::Specification.new do |s|
  s.name = 'ruby-vnu'
  s.author = 'Laurent Arnoud'
  s.email = 'laurent@spkdev.net'
  s.homepage = "http://github.com/spk/#{s.name}"
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.0.0'
  s.summary = 'Ruby wrapper for Nu HTML validator'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.add_development_dependency('rake', '~> 10.3')
  s.add_development_dependency('minitest', '~> 5.4')
  s.add_development_dependency('pry', '~> 0.9')
  s.require_path = 'lib'
  s.files = Dir['README.rdoc', 'Rakefile', 'LICENSE', 'vnu.jar',
                'lib/**/*.rb',
                'spec/**/*']
  s.description = %(Ruby wrapper for Nu HTML validator (https://validator.github.io/validator/))
  s.test_files = Dir.glob('spec/**/*_spec.rb')
end
