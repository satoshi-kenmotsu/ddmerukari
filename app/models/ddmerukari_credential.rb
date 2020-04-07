class DdmerukariCredential < ApplicationRecord
  belongs_to :user, optional: true
end
