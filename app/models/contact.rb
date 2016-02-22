class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message,   :validate => true
  attribute :nickname,  :captcha  => true # Hidden field to protect against spambots
  
  def headers 
    {
    :subject => "Contact Form",
    :to => "me@shanecarr.net",
    :form => %("#{name}" <#{email}>)
    }
  end
  
  
end