class Amigo < ActiveRecord::Base
  belongs_to :usuario, :foreign_key => "amigo_uno_id"
  belongs_to :usuario, :foreign_key => "amigo_dos_id"
end
