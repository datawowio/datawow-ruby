require 'rails/generators/base'
require 'securerandom'

module Datawow
  module Generators
    # :nodoc:
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)

      desc 'Creates a Datawow initializer
       and copy locale files to your application.'

      def copy_initializer
        template 'datawow_api.rb', 'config/initializers/datawow_api.rb'
      end
    end
  end
end
