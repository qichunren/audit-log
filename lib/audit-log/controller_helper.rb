module AuditLog
  module ControllerHelper
    # Create an audit log
    #
    # audit!(:edit_account, @account, payload: account_params)
    def audit!(action, record = nil, payload: nil, user: nil)
      user ||= self.send(AuditLog.config.current_user_method.to_sym)
      # audit! method may used in no controller class, eg: ActionCable channel
      current_request = respond_to?(:request) ? request : nil
      AuditLog.audit!(action, record, payload: payload, request: current_request, user: user)
    end
  end
end
