# -*- encoding : utf-8 -*-
require 'mdwa/dsl'
MDWA::DSL.entities.register "ContatoSite" do |e|
  
  e.resource  = true
  e.ajax      = true
  e.scaffold_name = 'a/contato_site'
  e.model_name = 'a/contato_site'
  
  e.attribute 'nome', 'string', {default: true, filtered: true}
  e.attribute 'email', 'string', {filtered: true}
  e.attribute 'telefone', 'string'
  e.attribute 'assunto', 'string', {filtered: true}
  e.attribute 'mensagem', 'text'
  
end

MDWA::DSL.entity('ContatoSite').in_requirements << 'gerenciar_contatos'