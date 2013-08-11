class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :set_user
  
  def set_user
    @me = Apache.new(params[:uname])
    @me = Apache.new(request.env['REMOTE_USER']) if request.env['REMOTE_USER']
    @me = Apache.new("wallace4") unless ENV["SERVER_NAME"] == "bruiser.mit.edu"
  end
  
end
