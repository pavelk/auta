class Notifier < ActionMailer::Base
  default_url_options[:host] = "autanasbavi.cz"

  def activate_account(user)
    subject "Aktivace uctu"
    from "Auta nas bavi <noreply@autanasbavi.cz>"
    headers "Reply-to" => "noreply@autanasbavi.cz"
    recipients user.email
    sent_on Time.now
    body[:token] = user.perishable_token
    #body :account_activation_url => account_activation_url(user.perishable_token)
  end
  
  def password_reset_instructions(user)
    subject "Nove heslo"
    from "Auta nas bavi <noreply@autanasbavi.cz>"
    recipients user.email
    sent_on Time.now
    #body :edit_password_reset_url => edit_password_reset_url(user.perishable_token)
    body[:token] = user.perishable_token
  end

end
