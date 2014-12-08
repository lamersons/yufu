class SmsGate
  def self.send_sms(phone, msg)
    uri = URI( "http://www.duanxin10086.com/sms.aspx")
    params = {userid:   10169,
              password: 369258,
              account:  'ya1053',
              mobile:   phone,
              content:  msg,
              action:   'send'

           }
    uri.query = URI.encode_www_form(params)

    if Rails.env.production?
      response = Net::HTTP.get_response(uri)
      response.is_a? Net::HTTPSuccess
    else
      true
    end
  end
end