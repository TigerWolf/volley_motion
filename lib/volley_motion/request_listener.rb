module VolleyMotion
  class RequestListener
    attr_accessor :activity, :responder

    def initialize(activity, responder)
      @activity = activity
      @responder = responder
    end

    def onResponse(json)
      responder = @responder.new(json)
      responder.on_response(@activity)
    end

  end
end
