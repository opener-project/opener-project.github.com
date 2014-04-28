require_relative '../lib/updater'

namespace :update do
  desc "Update documentation from Git repositories"
  task :documentation do
    Updater.new.update
  end
end
