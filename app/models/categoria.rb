# == Schema Information
# Schema version: 20100403213328
#
# Table name: categorias
#
#  id         :integer(4)      not null, primary key
#  nombre     :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Categoria < ActiveRecord::Base
  has_many :articulos
end
