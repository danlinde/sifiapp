class OrganizersController < Devise::RegistrationsController

	def show
		@organizer = Organizer.find(params[:id])
		@events = @organizer.events
		@sorted_events = (@events.sort_by {|event| event.id}).reverse!
		
		@active_events = @sorted_events.select {|event| event.deadline >= Time.now}
		@archive_events = @sorted_events.select {|event| event.deadline <= Time.now }

		@total = (if  (@sorted_events.inject(0) {|sum, x| sum + x.participants.count}).nil?
					0
				else
					@sorted_events.inject(0) {|sum, x| sum + x.participants.count}
				end)

	 	# @yes = (@sorted_events.inject(0) {|sum,x| sum + x.participants.where(response: "Yes").count} / total * 100).to_s + "%"
		# @no = (@sorted_events.inject(0) {|sum,x| sum + x.participants.where(response: "No").count} / total * 100).to_s + "%"
		# @no_response = (@sorted_events.inject(0) {|sum,x| sum + x.participants.where(response: nil).count} / total * 100).to_s + "%"
	end

	def build_resource(*args)
		super
		if session[:omniauth]
			@organizer.apply_omniauth(session[:omniauth])
			@organizer.valid?
		end
	end

	def create
		super
		session[:omniauth] = nil unless @organizer.new_record?
	end
end
