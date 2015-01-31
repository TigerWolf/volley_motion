module VolleyMotion
  class RequestListener
    attr_accessor :activity, :responder

    def initialize(activity, responder)
      @activity = activity
      @responder = responder
    end

    def onResponse(json)
      responder = @responder.new(json)
      @activity.update_display(responder)
    end

  end
end
