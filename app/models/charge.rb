class Charge
  AMOUNT = 500
  DESCRIPTION = "Pixtr Subscription Customer"

  def initialize(user, token)
    @user = user
    @token = token
  end

  def process
    if user.stripe_user?
      customer_id = user.stripe_customer_number
      create_charge(customer_id)
    else
      customer = create_customer
      customer_id = customer.id
      create_charge(customer_id)
    end

    user.upgrade(customer_id)
  end

  private

  attr_reader :user, :token

  def create_customer
    Stripe::Customer.create(
      :email => user.email,
      :card  => token
    )
  end

  def create_charge(customer_id)
    Stripe::Charge.create(
      :customer    => customer_id,
      :amount      => AMOUNT,
      :description => DESCRIPTION,
      :currency    => 'usd'
    )
  end

end
