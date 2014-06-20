class SystemMailer < ActionMailer::Base
  default from: 'store_system@baseproject.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.system_mailer.new_account.subject
  #
  def new_account(user)
    @user = user
    @user_name = @user.full_name
    @user_email = @user.email

    mail(to: @user.email, subject: 'Welcome to the jungle')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.system_mailer.contact_message.subject
  #
  def contact_message(contact, store, email)
    @contact = contact
    @store = store

    mail(to: email, subject: 'Thanks for contact us')
  end
end
