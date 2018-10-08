require_relative 'object'
require_relative 'clients/twilio'

module Services
  class SendSms < Services::Object
    def initialize(recipient, message)
      @recipient = recipient
      @message = message
    end

    def call
      errors.add :validation, "Missing recipient's number." if @recipient.empty?
      errors.add :validation, "Missing message to recipient." if @message.empty?
      send_message unless errors.any?
    end

    private

    def send_message
      request = Services::Clients::Twilio.call(@recipient, @message)
      errors.add_multiple_errors(request.errors) if request.failure?
      request
    end
  end
end