# frozen_string_literal: true

# ApplicationRecord: abstract class that describes methods models should have
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
