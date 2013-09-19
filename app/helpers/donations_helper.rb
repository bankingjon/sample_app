module DonationsHelper

# Returns the sum of amounts for a collection of donations.
	def sum_amount(donations)
		amount = 0
		donations.each do |donation| 
			amount = amount+donation.amount
		end
		return amount
	end

	def avg_gift(donations)
		if donations.count == 0
			return "n/a"	
		else
			avggift = sum_amount(donations) / donations.count
			return number_to_currency(avggift)
		end
	end

def revenue(donations)
	return number_to_currency(sum_amount(donations))
end

def response(appeals, donations)
	if appeals.count == 0
		return "n/a"
	else
		rate = donations.count.to_f / appeals.count.to_f * 100
		return number_to_percentage(rate, precision: 2)
	end
end

def mailing_cost(appeals)
	return 0  # waiting to add mailing cost detail to appeals or packages models
end

def postage_cost(appeals)
	return 0  # waiting to add mailing cost detail to appeals or packages models
end

def net_revenue(appeals, donations)
	net = sum_amount(donations) - mailing_cost(appeals) - postage_cost(appeals)
	return number_to_currency(net)
end

	def revenue_cost(appeals, donations)
		if sum_amount(donations) == 0
			return "n/a"
		else
			r_cost = (mailing_cost(appeals) + postage_cost(appeals)) / sum_amount(donations)
			return number_to_currency(r_cost)
		end
	end

	def gross_yield(appeals, donations)
		if appeals.count == 0
			return "n/a"
		else
			gross = sum_amount(donations)
			g_yield = gross / appeals.count * 1000
			return number_to_currency(g_yield)
		end
	end

	def net_yield(appeals, donations)
		if appeals.count == 0
			return "n/a"
		else
			net = sum_amount(donations) - mailing_cost(appeals) - postage_cost(appeals)
			n_yield = net / appeals.count * 1000
			return number_to_currency(n_yield)
		end
	end

end

