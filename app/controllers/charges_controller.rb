class ChargesController < ApplicationController

  def create
    charge = Charge.new(current_user, params[:stripeToken])
    charge.process
    flash[:success] = "You paid successfully."
    redirect_to profile_path
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end

  def destroy
    current_user.downgrade
    redirect_to profile_path
  end

end
