Gem::Specification.new do |s|
  s.name        = 'call_action'
  s.version     = '2.3.1'
  s.date        = '2017-05-11'
  s.summary     = "CallAction API "
  s.description = "Ruby wrapper for CallAction API to be used within Ruby On Rails (RoR) and other Ruby based frameworks"
  s.authors     = ["Shahzad Tariq"]
  s.email       = 'm.shahzad.tariq@hotmaul.com'
  s.files       = `git ls-files`.split($\).reject{|f| f =~ /(\.gemspec)/ }
  s.require_paths = ['lib']
  s.homepage    = 'https://callaction.co/documentation/developers/api/v1/index.html'
  s.license       = 'MIT'
end