class Message < ApplicationRecord
    validates :content, presence:true,length:{ maximum: 255,too_long:"最大255文字まで使えます。"}
    validates :title, presence: true, length: { maximum: 255,too_long: "長すぎやろわら"}
end
