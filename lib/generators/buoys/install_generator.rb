# frozen_string_literal: true

require 'rails/generators'

module Buoys
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    class_option :template

    def create_files
      copy_file 'buoys.en.yml', 'config/locales/buoys.en.yml'
      copy_file 'breadcrumbs.rb', 'config/buoys/breadcrumbs.rb'

      if %w(haml slim).include?(template_type = options[:template])
        copy_file "_buoys.html.#{template_type}", "app/views/breadcrumbs/_buoys.html.#{template_type}"
      else
        copy_file '_buoys.html.erb', 'app/views/breadcrumbs/_buoys.html.erb'
      end
    end
  end
end
