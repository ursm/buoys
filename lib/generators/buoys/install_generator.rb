require 'rails/generators'

module Buoys
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def create_files
      copy_file 'buoys.en.yml', 'config/locales/buoys.en.yml'
      copy_file '_buoys.html.erb', 'app/views/breadcrumbs/_buoys.html.erb'
      copy_file 'breadcrumbs.rb', 'config/buoys/breadcrumbs.rb'
    end
  end
end
