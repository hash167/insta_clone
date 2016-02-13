module ApplicationHelper

	def alert_for(name)
		{success: 'alert-success', alert: 'alert-warning'}[name.to_sym] || name.to_s
	end
end
