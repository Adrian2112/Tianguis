class Usuario < ActiveRecord::Base
  has_many :articulos
  has_many :amigos
  has_attached_file :imagenPerfil, :styles => { :medium => "200x200>" }

  attr_accessor :password_confirmation
  
  CARRERA = [
    # Displayed         stored in db
    [ "IA - Ingeniero Agronomo" , "IA" ],
    [ "IAB - Ingeniero en Agrobiotecnologia" , "IAB" ],
    [ "IIA - Ingeniero en Industrias Alimentarias" , "IIA" ],
    ["ARQ - Arquitecto", "ARQ"],
    ["LEC - Licenciado en Economia", "LEC"],
    ["IC - Ingeniero Civil","IC"],
    ["IBT - Ingeniero en Biotecnologia", "IBT"],
    ["IEC - Ingeniero en Electronica y Comunicaciones", "IEC"],
    ["IFI - Ingeniero Fisico Industrial", "IFI"],
    ["IIS - Ingeniero Industrial y de Sistemas", "IIS"],
    ["IMA - Ingeniero Mecanico Administrador", "IMA"],
    ["IMD - Ingeniero Biomedico", "IMD"],
    ["IME - Ingeniero Mecanico Electricista", "IME"],
    ["IMT - Ingeniero en Mecatronica", "IMT"],
    ["INT - Ingeniero en Negocios y Tecnologias de Informacion", "INT"],
    ["IQA - Ingeniero Quimico Administrador", "IQA"],
    ["IQS - Ingeniero Quimico y de Sistemas", "IQS"],
    ["ISD - Ingeniero en Sistemas Digitales y Robotica", "ISD"],
    ["ITC - Ingniero en Tecnologias Computacionales", "ITE"],
    ["ITE - Ingeniero en Tecnologias Electronicas", "ITE"],
    ["ITIC - Ingeniero en Tecnologias de Informacion y Comunicaciones", "ITIC"],
    ["ITM - Ingeniero en Telecomunicacion y Microelectronica", "ITM"],
    ["LAD - Licenciado en Animacion y Arte Digital", "LAD"],
    ["LAE - Licenciado en Administracion de Empresas", "LAE"],
    ["LAF - Licenciado en Administracion Financiera", "LAF"],
    ["LAN - Licenciado en Agronegocios  Internacionales", "LAN"],
    ["LAS - Licenciado en Administracion de Sistemas de Salud", "LAS"],
    ["LCC - Licenciado en Ciencias de la Comuniacion", "LCC"],
    ["LCE - Licenciado en Ciencias de la Enfermeria", "LCE"],
    ["LCQ - Licenciado en Ciencias Quimicas", "LCQ"],
    ["LDF - Licenciado en Derecho y Finanzas", "LDF"],
    ["LDI - Licenciado en Diseno Industrial", "LDI"],
    ["LED - Licenciado en Derecho", "LED"],
    ["LEM - Licenciado en Mercadotecnia", "LEM"],
    ["LHS - Licenciado en Humanidades y Ciencias Sociales", "LHS"],
    ["LIN - Licenciado en Negocios Internacionales", "LIN"],
    ["LLE - Licenciado en Lengua y Literatura Hispanicas", "LLE"],
    ["LMI - Licenciado en Periodismo y Medios de Informacion", "LMI"],
    ["LNB - Licenciado en Nutricion y Bienestar Integral", "LNB"],
    ["LPL - Licenciado en Ciencia Politica", "LPL"],
    ["LPO - Licenciado en Psicologia Organizacional", "LPO"],
    ["LRI - Licenciado en Relaciones Internacionales", "LRI"],
    ["LSC - Licenciado en Sistemas de Computacion Administrativa", "LSC"],
    ["LATI - Licenciado en Administracion de Tecnologias de Informacion", "LATI"],
    ["MC - Medico Cirujano", "MC"],
    ["MO - Medico Cirujano Odontologo", "MO"]
    
    
  ]

  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_presence_of :nombre, :nickname, :email, :carrera
  validates_format_of   :email, :with => EmailRegex
  validates_uniqueness_of :email, :nickname
  validates_inclusion_of :carrera, :in => CARRERA.map {|disp, value| value}
  validates_length_of :nickname, :in => 4..25
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
    errors.add(:password, "No puede estar en blanco" ) if hashed_password.blank?
  end

  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end

  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end

end
