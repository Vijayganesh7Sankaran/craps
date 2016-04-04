class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by_email(params[:session][:email])
		if @user && @user.authenticate(params[:session][:password])
			session['user_id'] = @user.id
			redirect_to '/'
		else
		  @user1 = Admin.find_by_email(params[:session][:email])
      if @user1 && @user1.password == params[:session][:password]
        session['admin_id'] = @user1.id
        redirect_to '/admin'
      else
        redirect_to '/login'
      end
			
		end
	end

	def destroy
		session['user_id'] = nil
		redirect_to '/'

	end
end
