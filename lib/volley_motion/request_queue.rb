module VolleyMotion
  class RequestQueue
    class << self
      def build(activity)
        request_queue = Com::Android::Volley::Toolbox::Volley.newRequestQueue(activity)
      end
    end
  end
end
