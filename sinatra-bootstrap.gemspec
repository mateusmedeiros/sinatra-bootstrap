Gem::Specification.new do |s|
  s.name = "sinatra-bootstrap"
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michal Fojtik", "Mateus Medeiros"]
  s.date = Date.today.to_s
  s.description = "Helpers for Bootstrap 3 on Sinatra"
  s.email = "dood-ad@outlook.com"
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.files = [ 'lib/sinatra/twitter-bootstrap.rb' ]
  s.files += Dir['lib/sinatra/assets/*']

  s.homepage = "http://github.com/mateusmedeiros/sinatra-bootstrap"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Helpers for Bootstrap 3 on Sinatra"
end
