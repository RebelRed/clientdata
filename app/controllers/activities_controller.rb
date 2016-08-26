class ActivitiesController < ApplicationController
  def index
     @activities = PublicActivity::Activity.order('created_at DESC').limit(10)
   
  end
end
