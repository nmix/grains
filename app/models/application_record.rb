# Base abstract class for ActiveRecord models
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
