class FormObject
  include ActiveModel::Model
  attr_accessor :postnumber, :prefecture_id, :municipality, :street_address, :building, :tel, :item_id, :user_id, :token, :price

  # ここにバリデーションの処理を書く
with_options presence: true do
  validates :postnumber, format: { with: /\A\d{3}-\d{4}\z/ }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipality
  validates :street_address
  validates :tel, format: { with: /\A\d{10,11}\z/ }
  validates :token
  validates :user_id
  validates :item_id
end

  def save
    buy = Buy.create(item_id: item_id, user_id: user_id)
    ShippingDestination.create(postnumber: postnumber, prefecture_id: prefecture_id, municipality: municipality, street_address: street_address, building: building, tel: tel, buy_id: buy.id)
  end
end