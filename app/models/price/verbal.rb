module Price
  class Verbal < Base
    field :level, type: Integer

    validates :level, presence: true
  end
end
