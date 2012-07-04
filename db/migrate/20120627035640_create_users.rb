class CreateUsers < ActiveRecord::Migration
  def up

  	create_table :users do |t|
  		t.string :email                
  		t.string :password             #senha


      t.integer :city_id             #cidade
      t.string  :fields              #area de atuação
      t.string  :portifolio_of_oab   #carteira da OAB
      t.string  :phone               #telefone
      t.text    :about               #sobre min

      t.integer  :teaching            #magistério
      t.integer  :professional        #profissional
      t.integer  :books_published     #livros publicados
      t.integer  :articles_published  #artigos publicados

      t.boolean :postgraduate        #pós-graduado
      t.boolean :doctorate_in_law    #doutorado em direito
      t.boolean :master_of_law       #mestrado em direito
      t.boolean :postgraduate_in_law #pós-graduado em direito
      t.boolean :foreign_laguage     #língua estrangeira
      t.boolean :terms_of_use        #termos de uso

  		t.timestamps                   #criado/atualizado em...
	   end

     add_index(:users,:email,:unique =>true)

  end

  def down

  	drop_table :users

  end
end
