# == Schema Information
# Schema version: 20100403213328
#
# Table name: usuarios
#
#  id               :integer(4)      not null, primary key
#  nombre           :string(255)
#  apellido_paterno :string(255)
#  apellido_materno :string(255)
#  sexo             :string(255)
#  nickname         :string(255)
#  hashed_password  :string(255)
#  salt             :string(255)
#  telefono         :string(255)
#  fecha_nacimiento :date
#  email            :string(255)
#  carrera          :string(255)
#  reputacion       :integer(10)
#  created_at       :datetime
#  updated_at       :datetime
#

class Usuario < ActiveRecord::Base
  has_many :articulos
  has_many :amigos

CARRERA = [
  # Displayed         stored in db
  [ "IA - Ingeniero Agronomo" , "IA" ],
  [ "IAB - Ingeniero en Agrobiotecnologia" , "IAB" ],
  [ "IIA - Ingeniero en Industrias Alimentarias" , "IIA" ]
]

validates_inclusion_of :carrera, :in =>
  CARRERA.map {|disp, value| value}


  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_presence_of :nombre, :nickname, :email, :carrera
  validates_format_of   :email, :with => EmailRegex
  validates_uniqueness_of :email, :nickname

  attr_accessor :password_confirmation
  validates_confirmation_of :password

  validate :password_non_blank

  def self.authenticate(nickname, password)
    usuario = self.find_by_nickname(nickname)
    if usuario
      expected_password = encrypted_password(password, usuario.salt)
      if usuario.hashed_password != expected_password
        usuario = nil
      end
    end
    usuario
  end

  # 'password' is a virtual attribute
  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = Usuario.encrypted_password(self.password, self.salt)
  end
  
  private
   def password_non_blank
     errors.add(:password, "Falta el password" ) if hashed_password.blank?
   end
   
   def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
   end
   
   def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
   end

end
