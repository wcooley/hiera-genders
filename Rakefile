require 'rake'
require 'puppetlabs_spec_helper/rake_tasks'

desc "Run spec tests with hiera config for good genders file"
RSpec::Core::RakeTask.new(:spec_standalone_good) do |t|
    t.pattern = 'spec/functions/**/*good_spec.rb'
end

desc "Run spec tests with hiera config for broken genders file"
RSpec::Core::RakeTask.new(:spec_standalone_broken) do |t|
    t.pattern = 'spec/functions/**/*broken_spec.rb'
end

desc "Run prep and standalone_{good,broken} tasts"
task :spec_separately do
  Rake::Task[:spec_prep].invoke
  Rake::Task[:spec_standalone_good].invoke
  Rake::Task[:spec_standalone_broken].invoke
end
