# -*- encoding : utf-8 -*-
require 'mdwa/dsl'
MDWA::DSL.requirements.register do |r|
  
  r.summary     = 'Gerenciar contatos.'
  r.alias       = 'gerenciar_contatos'
  r.description = %q{Gerencia a entrada de novos contatos, armazenando em banco de dados e enviando um email.}
  
  r.entities    = ['ContatoSite']
end
