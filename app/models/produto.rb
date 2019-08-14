class Produto < ApplicationRecord
    mount_uploader :image, ImageUploader
    before_save { nome.upcase! }
    belongs_to :user
end