module Profile
  class Client < Base
    field :company_name, localize: true
    field :company_uid
    field :country, localize: true
  end
end