class ContatosSiteController < ApplicationController

	def new
		@contato_site = A::ContatoSite.new
	end

	def salvar
		@contato_site = A::ContatoSite.new( params[:a_contato_site] )
		salvou = @contato_site.save

		# se salvou, envia emails para o admin e o cliente
		if salvou
			@system_notice = t('contatos_site.frontend.salvar_notice')
			ContatosSiteMailer.avisar_administrador(@contato_site).deliver
			ContatosSiteMailer.avisar_cliente(@contato_site).deliver
		end

		respond_to do |format|
			format.js
		end

	end
	
end