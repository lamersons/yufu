class SmsGate
  def self.send_sms(phone, msg)
    uri = URI( "http://www.duanxin10086.com/servlet/UserServiceAPI")
    params = {username: 'ya1053',
              password:  Base64.encode64('369258'),
              mobile: phone,
              content: msg,
              smstype: 1,
              method: 'sendSMS'
    }
    uri.query = URI.encode_www_form(params)

    if true || Rails.env.production?
      response = Net::HTTP.get_response(uri)
      response.is_a? Net::HTTPSuccess
    else
      true
    end
  end
end