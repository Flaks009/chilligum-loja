class Produto < ApplicationRecord
    mount_uploader :image, ImageUploader
    before_save { nome.upcase! }
end