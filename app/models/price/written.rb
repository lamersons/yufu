module Price
  class Written < Base
    validates :level, presence: true, inclusion: Order::Written::TYPES
  end
end
