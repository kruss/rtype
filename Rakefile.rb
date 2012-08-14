require "rubygems/package_task"

spec = Gem::Specification.load("gemspec")
Gem::PackageTask.new(spec){ |pkg| }

task :default => [:gem]

desc "Install the gem"
task :install => [:gem] do
    sh("gem install pkg/#{spec.name}-#{spec.version}.gem")
end

desc "Uninstall the gem"
task :uninstall do
    sh("gem uninstall #{spec.name}")
end

desc "Remove temporary artifacts"
task :clean do
    sh("rm -rf pkg/#{spec.name}-#{spec.version}")
end
