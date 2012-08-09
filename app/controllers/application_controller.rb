class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  protected
  def render_404
    raise ActionController::RoutingError.new('Not Found')
  end
end

