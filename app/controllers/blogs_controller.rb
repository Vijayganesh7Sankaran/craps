class BlogsController < ApplicationController
	def new
		@user = User.find_by_id(session['user_id'])
	end

before_action :require_user, only: [:new]
end
