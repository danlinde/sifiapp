class ChargesController < ApplicationController

	# Stripe.api_key = 'sk_test_hGkKefy6ypvWw2YudQZq7fvv'

	# token = params[:stripeToken]

	def new
		@amount = 2000
	end

	def create
	  # Amount in cents
	  @amount = 2000 # need to link to organizer input amount per participant

	  charge = Stripe::Charge.create({
	  	:amount => @amount, # amount in cents, again
    	:currency => "gbp",
    	:card =>  params[:stripeToken],
    	:description => "SetForget",
	    :application_fee    => 100#cents
	    # :customer    => customer.id,
	    # :amount      => @amount,
	    # :description => 'Rails Stripe customer',
	    # :currency    => 'usd'
		},
	    current_organizer.authentications.find_by_provider('stripe_connect').token
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end
end
