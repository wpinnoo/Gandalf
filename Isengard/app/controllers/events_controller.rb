class EventsController < ApplicationController

  # order is important here, we need to be authenticated before we can check permission
  before_filter :authenticate_user!, except: [:show, :index]
  load_and_authorize_resource only: [:new, :show, :update, :edit, :destroy]

  respond_to :html, :js

  def index
    @events = Event.where('end_date > ?', DateTime.now).order(:name)
    if user_signed_in?
      @events += Event.accessible_by(current_ability).to_a
    end
    @events.uniq!

  end

  def show
    @registration = @event.registrations.build
  end

  def new
  end

  def edit
  end

  def destroy
    @event.destroy
    redirect_to action: :index
  end

  def registration_times
    @event = Event.find params.require(:event_id)
    authorize! :update, @event
    if @event.update params.require(:event).permit(:registration_close_date, :registration_open_date, :show_ticket_count)
      flash[:notice] = "succesfully updated registration times"
    else
      flash[:error] = "something went wrong"
    end
    respond_with @event
  end

  def update
    @event.update params.require(:event).permit(:name, :organisation, :location, :website, :start_date, :end_date, :description)
    respond_with @event
  end

  def create
    authorize! :create, Event
    @event = Event.create(params.require(:event).permit(:name, :organisation, :location, :website, :start_date, :end_date, :description).merge club: current_user.club)
    respond_with @event
  end

end
