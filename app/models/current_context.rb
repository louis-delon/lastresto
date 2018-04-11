class CurrentContext
  attr_reader :seller, :buyer

  def initialize(seller, buyer)
    @seller = seller
    @buyer = buyer
  end
end
