class Produto < ApplicationRecord
    mount_uploader :image, ImageUploader
end
