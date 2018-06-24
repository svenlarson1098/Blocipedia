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
    
  #where the real magic happens
  charge = Stripe::Charge.create(
    customer: customer.id,  #this is NOT the user_id in the app
    amount: @amount, 
    description: "Blocipedia SS Membership - #{current_user.email}",
    currency: 'usd'
    )
  
  flash[:notice] = "Thanks for the moolah, #{current_user.email}! Feel free to pay us again, anytime."
  redirect_to root_path(current_user)
  
  #Strip will send back CardErrors, with friendly messages when something goes wrong.
  #This 'rescue block' catches and displays those errors.
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path

end
end