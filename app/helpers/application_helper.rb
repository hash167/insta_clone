module ApplicationHelper

	def alert_for(name)
		{success: 'alert-success', alert: 'alert-warning', notice: 'alert-info'}[name.to_sym] || name.to_s
	end
end
