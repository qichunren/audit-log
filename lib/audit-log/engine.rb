# frozen_string_literal: true
require_relative "./controller_helper.rb"
module AuditLog
  
  class Engine < Rails::Engine
    isolate_namespace AuditLog

    ActiveSupport.on_load(:action_controller) do
      prepend ControllerHelper
    end

    AuditLog::LogSubscriber.attach_to :audit_log
    
  end
end
