module Calendar
  class EventsController < ApplicationController
    
    def calendar
    end
    
    def mit_events
      @mit_events = Calendar::Mit.get_registrar_events(event_filter_params(params))
      render json: @mit_events
    end
    
    def index
      @dke_events = Calendar::Event.get_events(event_filter_params(params))
      render json: @dke_events
    end
    
   private
   
    def event_filter_params(params)
      return params.permit(:start, :end)
    end
    
  end
end
