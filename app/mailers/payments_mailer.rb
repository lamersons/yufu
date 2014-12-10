class PaymentsMailer < ActionMailer::Base

  def bank_payment(profile)
    mail to: profile.user.email, subject: I18n.t(:bill_for_bank_payment)
  end

end