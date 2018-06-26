class ChargesController < ApplicationController
  
  def new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }",
      description: "Blocipedia Secret Society - #{current_user.email}",
      amount: @amount
    }
  end

def create
  @amount = 500
  customer = Stripe::Customer.create(
    email: current_user.email,
    card: params[:stripeToken]
    )
    

  charge = Stripe::Charge.create(
    customer: customer.id,  #this is NOT the user_id in the app
    amount: @amount, 
    description: "Blocipedia SS Membership - #{current_user.email}",
    currency: 'usd'
    )

  current_user.premium!
  flash[:success] = "Thank you for your payment, #{current_user.email}! Welcome to the Society."
  redirect_to root_path(current_user)

  
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path

end
end

