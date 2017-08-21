require 'rails/generators'

module CriticalPathCss
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path('..', __FILE__)

    # Copy the needed rake task for generating critical CSS
    def copy_rake_task
      task_filename = 'critical_path_css.rake'
      copy_file "../../tasks/#{task_filename}", "lib/tasks/#{task_filename}"
    end

    # Copy the needed configuration YAML file for generating critical CSS
    def copy_config_file
      task_filename = 'critical_path_css.yml'
      copy_file "../../config/#{task_filename}", "config/#{task_filename}"
    end
  end
end
