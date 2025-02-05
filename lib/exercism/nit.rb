class Nit
  include Mongoid::Document

  field :at, type: Time, default: ->{ Time.now.utc }
  field :c, as: :comment, type: String

  belongs_to :user
  embedded_in :submission
end
