require 'digest'

class User < ActiveRecord::Base

	attr_accessible :email, :password, :password_confirmation, :city_id, :fields, :portifolio_of_oab,
      :phone, :about, :teaching, :professional, :books_published, :articles_published, :postgraduate, :doctorate_in_law,
      :master_of_law, :postgraduate_in_law, :foreign_laguage, :terms_of_use

	attr_accessor :password

	validates :email, :uniqueness =>true,
		:length => { :within => 5..50 },
		:format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i }


	validates :password, :confirmation => true,
		:length   => { :within => 4..20 },
		:presence => true,
		:if => :password_required?

	has_one :profile

	before_save :encrypt_new_password #antes de salvar criptografa password e atribui ao hashed_password

	#
	# Recebe email e password, primeiramente pesquisa se o email existe
	# Passa password para o método authenticated?(password) que retorna true/false
	# if user.email && user.authenticated forem true retorno o user
	#
	def self.authenticate?(email,password)
		user = find_by_email(email)
		return user if user && user.authenticated?(password)
	end

	#
	#Recebe password e compara com o hashed_password armazenado no banco retornando true/false
	#
	def authenticated?(password)
		self.hashed_password == encrypt(password)
	end

	#
	# Antes de salvar encriptografa password e atribui a coluna hashed_password
	#
	protected
	def encrypt_new_password
		return if password.blank?
		self.hashed_password = encrypt(password)
	end

	def password_required?
		hashed_password.blank? || password.present?
	end

	#
	# Recebe o password e retorna hexadecimal encriptografado com 40 caracteres
	#
	def encrypt(string)
		Digest::SHA1.hexdigest(string)
	end
end