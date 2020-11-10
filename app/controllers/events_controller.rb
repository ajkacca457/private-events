class EventsController < ApplicationController
  @event = Event.new

  before_action :authorization
  helper_method :events_user_attending, :test

  def index
    @events = Event.all
    @past_events = Event.past.paginate(page: params[:page], per_page: 2).order(created_at: :desc)
    @upcoming_events = Event.upcoming.paginate(page: params[:page], per_page: 2).order(created_at: :desc)
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.valid? && @event.save
      redirect_to user_path(current_user), notice: 'Event Created Successfully'
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
