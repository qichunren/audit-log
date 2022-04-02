# frozen_string_literal: true

require 'rails/generators'
module AuditLog
  module Generators
    class InstallGenerator < Rails::Generators::Base      
      source_root File.expand_path("templates", __dir__)

      desc "Create AuditLog's base files"

      # def add_initializer
      #   template 'config/initializers/audit-log.rb', 'config/initializers/audit-log.rb'
      #   template 'config/locales/audit-log.yml', 'config/locales/audit-log.yml'
      # end

      # def add_migrations
      #   exec('rake audit_log:install:migrations')
      # end

      def create_audit_log_model
        template "log.rb", "app/models/audit_log/log.rb"
      end

      def create_audit_log_model_concern
        template "audit_model_convern.rb", "app/models/audit_log/auditable.rb"
      end

      def create_audit_logs_controller
        template "audit_logs_controller.rb", "app/controllers/audit_log/logs_controller.rb"
      end

      def create_audit_logs_views
        template "views/logs/index.html.erb", "app/views/audit_log/logs/index.html.erb"
        template "views/logs/show.html.erb",  "app/views/audit_log/logs/show.html.erb"
      end

      def add_routes
        route %(
          namespace :audit_log do
            resources :logs, only: [:index, :show]
          end
          )
      end

    end
  end
end
