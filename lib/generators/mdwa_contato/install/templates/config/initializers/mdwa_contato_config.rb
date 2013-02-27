# -*- encoding : utf-8 -*-
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "qw3.com.br",
  :user_name            => "no-reply@qw3.com.br",
  :password             => "",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
