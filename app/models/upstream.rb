# frozen_string_literal: true

# Represents an external service that can contact us to send new offers through the API. The class serves for
# authentification purposes. The id (uuid) serves as the client key.
class Upstream < ApplicationRecord
  devise :trackable

  def make_module
    self.class.const_get((upstream_module || 'default').camelize)
  end
end
