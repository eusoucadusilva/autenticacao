class PagesController < ApplicationController

	#before_filter :authenticate, :except =>[:service,:about] except => permitir
	before_filter :authenticate, :only =>[:service,:about]  #only => restringir

	def index
	end

	def service
	end

	def about
	end

end