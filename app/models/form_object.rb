class FormObject
  include ActiveModel::Model
  attr_accessor :postnumber, :prefecture_id, :municipality, :street_address, :building, :tel, :item_id, :user_id, :buy_id

  # ここにバリデーションの処理を書く
  validates :postnumber, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }, presence: true
  validates :municipality, presence: true
  validates :street_address, presence: true
  validates :tel, presence: true
  validates :user_id
  validates :item_id
  validates :buy_id

  def save
    Buys.create(item_id: item_id, user_id: user_id)
    ShippingDestinations.create(postnumber: postnumber, prefecture_id: prefecture_id, municipality: municipality, street_address: street_address, building: building, tel: tel, buy_id: buy_id)
  end
end