class AdminController < ApplicationController
  def index
    #render plain: 'Some text'
    @admin = Admin.find_by_id(session['admin_id'])
  end
  
  def destroy
    session['admin_id'] = nil
    redirect_to '/'
  end
end
