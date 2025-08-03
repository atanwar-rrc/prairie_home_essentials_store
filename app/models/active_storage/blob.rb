class ActiveStorage::Blob < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    %w[id filename content_type metadata byte_size checksum created_at]
  end
end
