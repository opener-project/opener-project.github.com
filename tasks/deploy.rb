require 'psych'
require 'highline/import'

desc "Build, Copy & Deploy to github"
task :release => [:build, :copy, :deploy, :clean]

desc "Build the jekyll site"
task :build do
  puts "Building site"
  Dir.chdir('source') do
    `jekyll build`
  end
  puts "Done Building"
  Rake::Task["copy"].execute
end

desc "Copy the generated Jekyll site over to root"
task :copy => [:delete_unsafe_files] do
  cp_r "source/_site/.", "."
end

desc "Commit & Push the result to Github"
task :deploy do
  branch = `git rev-parse --abbrev-ref HEAD`
  `git push origin #{branch}`
end

task :commit do
  `git status`
  answer = ask("Please type your commit message. (Leave empty to abort)")
  if answer.empty?
    abort("Commit and any further tasks aborted due to empty commit message")
  end
  `git add .`
  `git commit -m "#{answer}"`
end

task :delete_unsafe_files do
  # Remove any directories that can collide with the basics
  # It wouldn't be a big problem, but it can cause confusion
  # and a lot of litter.
  filelist = config_excluded_files.map{|filename| "source/_site/#{filename}"}
  rm_rf filelist
end

task :clean do
  rm_r "source/_site", :force=>true
end

desc "Destroy all generated files from root"
task :reset do
  rm_r (Dir.glob("*") - excluded_files), :force=>true
end

def config_excluded_files
  config = YAML.load_file("_config.yml")
  filelist = config["exclude"]
end

def excluded_files
  filelist = []
  filelist.concat(Dir.glob("*.md"))
  filelist.concat(Dir.glob("_*"))
  filelist.concat(Dir.glob(".*"))
  filelist.concat(config_excluded_files)
  return filelist - [".",".."]
end
