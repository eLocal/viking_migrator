module Viking
  class VikingRecord < ActiveRecord::Base
    self.abstract_class = true

    connects_to database: { writing: :viking_core, reading: :viking_core } unless Rails.env.test?
  end
end