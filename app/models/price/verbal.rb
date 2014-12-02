module Price
  class Verbal < Base
    field :level, type: Integer

    validates :level, presence: true

    def name
      "Level - #{level}"
    end
  end
end
