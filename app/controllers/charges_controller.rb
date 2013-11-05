class ChargesController < ApplicationController
	Stripe.api_key = 'sk_test_hGkKefy6ypvWw2YudQZq7fvv'

	def new
		@event = Event.find params[:event_id]
		@participant = Participant.find_by_token session[:participant_token]
	end

	def create
	  @event = Event.find params[:event_id]
	  @participant = Participant.find_by_token session[:participant_token]
	  # Amount in cents
	  @amount = (@event.amount * 100).to_i

	  unless Rails.env.test?
		  customer = Stripe::Customer.create(
		    :email => @participant.email,
		    :card  => params[:stripeToken]
		  )

		  charge = Stripe::Charge.create(
		    :customer    => customer.id,
		    :amount      => @amount,
		    :description => 'Rails Stripe customer',
		    :currency    => 'gbp'
		  )
	    end

	  @participant.paid = true
	  @participant.save

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end
end
