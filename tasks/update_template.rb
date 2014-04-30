file "master.zip" do
  puts "Downloading latest version of template"
  `wget -N https://github.com/opener-project/jekyll-page-template/archive/master.zip`
  Rake::Task["clean:zip"].reenable
end

file "template" =>[:unzip_template] do
  rm "template/Rakefile", :force=>true
  rm_r "template/custom", :force=>true
  Rake::Task["clean:template"].reenable
  Rake::Task["unzip_template"].reenable
end

task :unzip_template =>["master.zip", :'clean:template'] do
  puts "Expanding latest version of template."
  `unzip master.zip`
  `mv jekyll-page-template-master template`
end

task :copy => ["template"] do
  puts "Copying over template files."
  `cp -R template/* .`
  `cp -R custom/* .`
  puts "All files have been put in place"
end

desc "Soft update: do overwrite, but not remove any files."
task :update => [:'update:rakefile'] do
  puts "Diving deep into the multiverse..."
  `rake update:no_rakefile`
end

namespace :update do
  desc "Remove all template files first, then update"
  task :force => [:'remove_template'] do
    Rake::Task["update"].invoke
  end

  desc "Update but skip Rakefile"
  task :no_rakefile => [:copy] do
    Rake::Task["clean"].invoke
    puts "Done, it was a pleasure working with you. Enjoy the result..."
  end

  desc "Get the latest Rakefile from github"
  task :rakefile =>[:unzip_template] do
    cp "template/Rakefile", "Rakefile"
  end
end

task :remove_template => ["template"] do
  puts "Removing all template files."
  files = FileList["template/*"]
  files.each do |filename|
    rm_r filename.gsub(/^template/,'.'), :force=>true
  end
end

task :clean => [:'clean:zip', :'clean:template'] do
  puts "The maid has left the building, all is shiny and clean. Don't forget to thank her."
end

namespace :clean do
  task :zip do
    puts "removing the template zip"
    rm "master.zip", :force=>true
  end

  task :template do
    puts "Removing the template folder"
    rm_r "template", :force=>true
  end
end

task :default => [:update]
task :clobber => [:remove_template, :clean]
