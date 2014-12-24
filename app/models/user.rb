class User
  include Mongoid::Document
  include Personalized
  include Mongoid::Paperclip
  before_save :set_avatar_extension
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_mongoid_attached_file :avatar, default_url: "/no-avatar.png", style: {thumb: '73x73'}
  validates_attachment_content_type :avatar, content_type: %w(image/jpg image/jpeg image/png)
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

  # messaging system
  has_many :inbox,  class_name: 'Message', inverse_of: :recipient
  has_many :outbox, class_name: 'Message', inverse_of: :sender

  has_and_belongs_to_many :localizations

  embeds_many :permissions
  accepts_nested_attributes_for :permissions, :profiles

  alias :name :email

  scope :without_admins, -> {where _type: 'User'}

  #check that new  password is not equals to old
  validate :new_password, if: -> {password.present? && encrypted_password_was.present?}

  def translator?
    profiles.where(:_type.in => [Profile::Translator::Individual.to_s, Profile::Translator::Company.to_s],
                   is_active: true, total_approve: true ).count > 0
  end
  alias :is_translator :translator?

  def client?
    profiles.where(_type: Profile::Client.to_s).count > 0
  end
  alias :is_client :client?

  def can_manage_localizations?
    localizations.count > 0
  end
  alias :can_manage_localizations :can_manage_localizations?

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

  def client_profile
    profiles.where(:_type.in => [Profile::Client.to_s]).first
  end

  private
  def new_password
    bcrypt   = ::BCrypt::Password.new(encrypted_password_was)
    password = ::BCrypt::Engine.hash_secret("#{self.password}#{self.class.pepper}", bcrypt.salt)
    errors[:password] << I18n.t('mongoid.errors.messages.password_is_not_new') if bcrypt.eql? password
  end

  def set_avatar_extension
    if self.avatar_content_type.nil? || self.avatar_file_name != 'data'
      return true
    end
    begin
      name = SecureRandom.uuid
    end while !User.where(avatar_file_name: name).empty?
    extension = self.avatar_content_type.gsub('image/', '.')
    self.avatar.instance_write(:file_name, name+extension)
  end
end
