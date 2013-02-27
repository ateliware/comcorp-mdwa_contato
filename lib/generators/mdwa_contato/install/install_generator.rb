# -*- encoding : utf-8 -*-

require 'rails/generators'
require 'mdwa/dsl'

module MdwaContato
	class InstallGenerator < Rails::Generators::Base

		source_root File.expand_path("../templates", __FILE__)

		def instalacao

			# Inclui Rails Settings
			gem 'rails-settings', :git => "git://github.com/100hz/rails-settings.git"
			run 'bundle install'
			generate 'settings Settings'
			rake 'db:migrate'

		end

		def config
			copy_file 'config/initializers/mdwa_contato_inflections.rb', 'config/initializers/mdwa_contato_inflections.rb'
			copy_file 'config/initializers/mdwa_contato_config.rb', 'config/initializers/mdwa_contato_config.rb'
			copy_file 'config/locales/mdwa_contato.pt-BR.yml', 'config/locales/mdwa_contato.pt-BR.yml'
			copy_file 'config/locales/mdwa_contato.en.yml', 'config/locales/mdwa_contato.en.yml'
		end

		def mdwa
			copy_file 'requisitos/gerenciar_contatos.rb', MDWA::DSL::REQUIREMENTS_PATH + 'gerenciar_contatos.rb'
			copy_file 'entidades/contato_site.rb', MDWA::DSL::STRUCTURAL_PATH + 'contato_site.rb'
		end

		def geradores
			generate 'mdwa:templates'
			# copia os templates MDWA - admin e frontend
			directory 'templates', MDWA::DSL::TEMPLATES_PATH + 'contato_site'
			# roda a transformação
			generate 'mdwa:transform ContatoSite --skip-locales'
		end

		def mailers
			copy_file 'mailers/contatos_site_mailer.rb', 'app/mailers/contatos_site_mailer.rb'
			copy_file 'mailers/views/avisar_administrador.text.erb', 'app/views/contatos_site_mailer/avisar_administrador.text.erb'
			copy_file 'mailers/views/avisar_cliente.text.erb', 'app/views/contatos_site_mailer/avisar_cliente.text.erb'
		end

		def routes
			route "
	##########################################
	# Rotas para a configuração mdwa_contato #
	##########################################
	namespace :a do
	  controller :mdwa_contato_configuracao do
	    get 'mdwa_contato_configuracao/index' => 'mdwa_contato_configuracao#index', :as => 'mdwa_contato_configuracao_index'
	    post 'mdwa_contato_configuracao/salvar' => 'mdwa_contato_configuracao#salvar', :as => 'mdwa_contato_configuracao_salvar'
	  end
	end

	controller :contatos_site do
    get 'contato' => 'contatos_site#new', :as => 'contato'
    post 'contatos_site/salvar' => 'contatos_site#salvar', :as => 'contatos_site_salvar'
  end
	"
		end

	end
end