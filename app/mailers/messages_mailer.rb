class MessagesMailer < ActionMailer::Base
  def create(message)
    @body = message.body
    message.attachments do |attachment|
      attachments[attachment.data_file_name] = File.read(attachment.data.path) unless attachment.data.blank?
    end
    mail to: message.recipient.email, subject: t('new_messsage')
  end
end
