
task :default do
  puts pwd
  ruby 'tests/tests.rb'
end