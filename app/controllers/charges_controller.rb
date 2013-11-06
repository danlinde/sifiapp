class ChargesController < ApplicationController

	# Stripe.api_key = 'sk_test_hGkKefy6ypvWw2YudQZq7fvv'

	# token = params[:stripeToken]

	def new
		@event = Event.find params[:event_id]
		@participant = Participant.find_by_token session[:participant_token]

		if @event.organizer.authentications.find_by_provider('stripe_connect')
			@participant = Participant.find_by_token session[:participant_token]
		else
			flash[:notice] = 'The event organizer must connect with Stripe'
			redirect_to '/'
		end
	end

	def create
	  @event = Event.find params[:event_id]
	  @participant = Participant.find_by_token session[:participant_token]
	  # Amount in cents
	    
	  @amount = (@event.amount * 100).to_i

	  unless Rails.env.test?
		  customer = Stripe::Customer.create(
		    {:email => @participant.email,
		    		    :card  => params[:stripeToken]},
		   	@event.organizer.authentications.find_by_provider('stripe_connect').token
		  )

		  charge = Stripe::Charge.create(
		    {:customer    => customer.id,
		    :amount      => @amount,
		    :description => 'Rails Stripe customer',
		    :currency    => 'usd',
		    :application_fee    => 100}, #cents}
		    @event.organizer.authentications.find_by_provider('stripe_connect').token
		  )
	    end

	  @participant.paid = true
	  @participant.save


	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path
	end
end
