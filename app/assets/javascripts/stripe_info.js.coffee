stripeHidden = _.template """
<div>
<input type='hidden' name='stripeToken' value='<%= id %>' />
<input type='hidden' name='payment_method[name]' value='<%= name %>' />
<input type='hidden' name='payment_method[last4]' value='<%= last4 %>' />
<input type='hidden' name='payment_method[exp_month]' value='<%= exp_month %>' />
<input type='hidden' name='payment_method[exp_year]' value='<%= exp_year %>' />
</div>
"""