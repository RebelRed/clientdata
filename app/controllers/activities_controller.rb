class ActivitiesController < ApplicationController
  def index
     @activities = PublicActivity::Activity.order('created_at DESC').paginate(page: params[:page], per_page: 5)
   
  end
end
