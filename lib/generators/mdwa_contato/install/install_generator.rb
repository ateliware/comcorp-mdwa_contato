# -*- encoding : utf-8 -*-

require 'rails/generators'
require 'mdwa/dsl'

module MdwaEndereco
	class InstallGenerator < Rails::Generators::Base

		source_root File.expand_path("../templates", __FILE__)

		def instalacao
			# Config
			copy_file 'config/mdwa_contato_inflections.rb', 'config/initializers/mdwa_contato_inflections.rb'
			copy_file 'config/mdwa_contato.pt-BR.yml', 'config/locales/mdwa_contato.pt-BR.yml'
			copy_file 'config/mdwa_contato.en.yml', 'config/locales/mdwa_contato.en.yml'

			# MDWA
			copy_file 'requisitos/gerenciar_contatos.rb', MDWA::DSL::REQUIREMENTS_PATH + 'gerenciar_contatos.rb'
			copy_file 'entidades/contato_site.rb', MDWA::DSL::STRUCTURAL_PATH + 'contato_site.rb'
		end

		def geradores
			generate 'mdwa:templates ContatoSite'
			generate 'mdwa:transform ContatoSite --skip-locales'
		end

		def mailers
			copy_file 'mailers/contatos_site_mailer.rb', 'app/mailers/contatos_site_mailer.rb'
			copy_file 'mailers/views/avisar_administrador.text.erb', 'app/views/avisar_administrador.text.erb'
			copy_file 'mailers/views/avisar_cliente.text.erb', 'app/views/avisar_cliente.text.erb'
		end

		def routes
			rotas = []
			rotas << '##########################################'
			rotas << '# Rotas para a configuração mdwa_contato #'
			rotas << '##########################################'
			rotas << 'namespace :a do'
			rotas << '  controller :mdwa_contato_configuracao do'
			rotas << '    get "mdwa_contato_configuracao/index" => "mdwa_contato_configuracao#index", :as => "mdwa_contato_configuracao_index"'
			rotas << '    post "mdwa_contato_configuracao/salvar" => "mdwa_contato_configuracao#salvar", :as => "mdwa_contato_configuracao_salvar"'
			rotas << '  end'
			rotas << 'end'
			
			route rotas.join("\n")
		end

	end
end