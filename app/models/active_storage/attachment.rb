class ActiveStorage::Attachment < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    %w[id name record_type record_id created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[blob]
  end
end
