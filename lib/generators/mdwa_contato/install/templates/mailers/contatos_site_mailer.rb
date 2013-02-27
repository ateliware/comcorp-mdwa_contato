# -*- encoding : utf-8 -*-

class ContatosSiteMailer < ActionMailer::Base
  
  def avisar_administrador( contato_site )
    @contato_site = contato_site
    mail( :to => Settings['MDWA_CONTATO.email_administrador'], :subject => I18n.t('mdwa_contato.assunto_administrador', :assunto => contato_site.assunto) ) do |format|
      format.text
    end
  end
  
  def avisar_cliente( contato_site )
    @contato_site = contato_site
    mail( :to => contato_site.email, :subject => I18n.t('mdwa_contato.assunto_cliente', :nome => contato_site.nome) ) do |format|
      format.text
    end
  end
  
end
