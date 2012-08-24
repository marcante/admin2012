class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :breadcrumb

  protected
  def render_404
    raise ActionController::RoutingError.new('Not Found')
  end

  def breadcrumb
    return unless user_signed_in?
    add_breadcrumb "Dashboard", :root_path
    return add_breadcrumb "Edit: #{current_user.name}", edit_user_registration_path(current_user) if controller_name =~ /registrations/ and action_name =~ /edit/

    add_breadcrumb controller_name.camelize, :"#{controller_name}_path" unless controller_name =~ /dashboard|registrations/
    add_breadcrumb "Create a new #{controller_name.singularize}", :"new_#{controller_name.singularize}_path" if action_name =~ /new|create/
    add_breadcrumb "Edit a #{controller_name.singularize}", :"edit_#{controller_name.singularize}_path" if action_name =~ /edit|update/
    add_breadcrumb "View a #{controller_name.singularize}", :"#{controller_name.singularize}_path" if action_name =~ /show/
  rescue
  end
end

