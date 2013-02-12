require_dependency "rollout_admin/application_controller"

module RolloutAdmin
  class AdminController < ApplicationController

  before_filter :authenticate

  def index
  	@feature_list = $rollout.features
  	@features = []
  	@feature_list.uniq.each { |feature| 
  		@features << $rollout.get(feature)
  	}
  end

  def create 
  	$rollout.activate_percentage(params[:feature_name], 0)
  	redirect_to index_path
  end

  def deactivate
    if params[:object_type] == "feature"
      $rollout.deactivate(params[:object].to_s)
    end
    redirect_to index_path    
  end

  def activate
    if params[:object_type] == "feature"
      $rollout.activate(params[:object].to_s)
    end
    redirect_to index_path    
  end

  def get_users
    if Object.const_defined?('User')
      @users=User.all
      render :json => @users
    else
      render :json => {'error' => 'no users defined'}
    end
  end

  def add
    if params[:object_type] == "user"
      $rollout.activate_user(params[:feature], User.find(params[:user].to_i))
      @feature = $rollout.get(params[:feature])
      render :json => @feature.users
    elsif params[:object_type] == "group"
      $rollout.activate_group(params[:feature], params[:group].to_sym)
      @feature = $rollout.get(params[:feature])
      render :json => @feature.groups
    elsif params[:object_type] == "ip"
      $rollout.activate_ip(params[:feature], params[:ip].to_s)
      @feature = $rollout.get(params[:feature])
      render :json => @feature.ips
    end
  end

  def remove 
    if params[:object_type] == "user"
      @user=User.where(RolloutAdmin.user_name_attribute.to_sym  => params[:user]).first
      if @user
        $rollout.deactivate_user(params[:feature], @user)
      end
      @feature = $rollout.get(params[:feature])
      render :json => @feature.users
    elsif params[:object_type] == "group"
      $rollout.deactivate_group(params[:feature], params[:group].to_sym)
      @feature = $rollout.get(params[:feature])
      render :json => @feature.groups
    elsif params[:object_type] == "ip"
      puts params[:ip]
      $rollout.deactivate_ip(params[:feature], params[:ip].to_s)
      @feature = $rollout.get(params[:feature])
      render :json => @feature.ips
    end
  end

  def update_percentage
    $rollout.activate_percentage(params[:feature].to_sym,params[:percentage].to_i)
    render :json => {:status => "success"}
  end

  protected

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == RolloutAdmin.auth_name && password == RolloutAdmin.auth_password
    end
  end

  end
end
