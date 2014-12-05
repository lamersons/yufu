class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  #agent's system
  belongs_to :overlord, class_name: 'User'
  has_many   :vassals,  class_name: 'User'
  has_many   :profiles, class_name: 'Profile::Base', dependent: :destroy
  has_many   :banners,  dependent: :destroy

  embeds_many :permissions
  accepts_nested_attributes_for :permissions, :profiles

  alias :name :email

  scope :without_admins, -> {where _type: 'User'}

  def translator?
    profiles.where(:_type.in => [Profile::Translator::Individual.to_s, Profile::Translator::Company.to_s],
                   is_active: true, total_approve: true ).count > 0
  end
  alias :is_translator :translator?

  def client?
    profiles.where(_type: Profile::Client.to_s).count > 0
  end
  alias :is_client :client?

  def partner?
    profiles.where(_type: Profile::Partner.to_s).count > 0
  end
  alias :is_partner :partner?

  def need_change_password?
    !self.is_a?(Admin) && self.sign_in_count <= 1
  end

  def translator_profile
    translator_profiles.where(is_active: true).first
  end

  def translator_profiles
    profiles.where(:_type.in => [Profile::Translator::Individual.to_s, Profile::Translator::Company.to_s])
  end

  def partner_profile
    profiles.where(:_type.in => [Profile::Partner.to_s]).first
  end
end
