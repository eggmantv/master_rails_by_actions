module SendSMS
  class << self

    MESSAGE_SUFFIX = "【蛋人商城】"

    SMS_API_KEY = ENV['SMS_API_KEY']
    SMS_SEND_URL = "https://sms-api.luosimao.com/v1/send.json"
    SMS_STATUS_URL = "https://sms-api.luosimao.com/v1/status.json"

    #
    # SendSMS.send "13718781273", "hello"
    # SendSMS.status
    #

    def send mobile, message
      options = {
        mobile: mobile,
        message: "#{message}#{MESSAGE_SUFFIX}"
      }

      begin
        response = RestClient.post SMS_SEND_URL, options, headers
        response = JSON.parse(response)
        Rails.logger.info "SMS: mobile #{mobile}, options: #{options}, response: #{response}"
      rescue => e
        response = e.message
      end

      unless response.try(:fetch, "error") == 0
        Rails.logger.info "SMS failed: mobile #{mobile}, options: #{options}, response: #{response}"
      end

      response
    end

    def status
      begin
        response = RestClient.get SMS_STATUS_URL, headers
        response = JSON.parse(response)
        Rails.logger.info "SMS: status #{response}"
      rescue => e
        response = e.message
      end

      response
    end

    private
    def headers
      { Authorization: "Basic " + Base64.encode64("api:key-#{SMS_API_KEY}").chomp }
    end

  end
end
