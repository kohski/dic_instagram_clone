class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: @contact.email,subject:"#{@contact.name}様のユーザー登録完了"
  end
end
