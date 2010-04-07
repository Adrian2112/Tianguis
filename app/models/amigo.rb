# == Schema Information
# Schema version: 20100403213328
#
# Table name: amigos
#
#  id           :integer(4)      not null, primary key
#  amigo_uno_id :integer(4)      not null
#  amigo_dos_id :integer(4)      not null
#  created_at   :datetime
#  updated_at   :datetime
#

class Amigo < ActiveRecord::Base
  belongs_to :usuario, :foreign_key => "amigo_uno_id"
  belongs_to :usuario, :foreign_key => "amigo_dos_id"
end
