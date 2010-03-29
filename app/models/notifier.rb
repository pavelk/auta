class Notifier < ActionMailer::Base
  default_url_options[:host] = "autanasbavi.cz"

  def send_user_mail(email)
    @recipients   = email
    @from         = "info@autanasbavi.cz"
    headers         "Reply-to" => "info@autanasbavi.cz"
    @subject      = "www.autanasbavi.cz"
    @sent_on      = Time.now
    @content_type = "text/html"
  end
  
  def new_user(name,psswd)
    #@recipients   = email
    @recipients   = "pavel.krusek@gmail.com"
    @from         = "info@autanasbavi.cz"
    headers         "Reply-to" => "info@autanasbavi.cz"
    @subject      = "novy uzivatel"
    @sent_on      = Time.now
    @content_type = "text/html"
    body[:name] = name
    body[:password] = psswd
  end
  
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
  
  def registration_confirmation_school( email, password )
    @recipients   = email
    @from         = "info@autanasbavi.cz"
    headers         "Reply-to" => "info@autanasbavi.cz"
    @subject      = "www.autanasbavi.cz"
    @sent_on      = Time.now
    @content_type = "text/html"
 
    body[:email] = email
    body[:password] = password
  end
  
  def registration_confirmation_employer( email, password )
    @recipients   = email
    @from         = "info@autanasbavi.cz"
    headers         "Reply-to" => "info@autanasbavi.cz"
    @subject      = "www.autanasbavi.cz"
    @sent_on      = Time.now
    @content_type = "text/html"
 
    body[:email] = email
    body[:password] = password
  end
end
