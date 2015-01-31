module VolleyMotion
  class JsonArrayRequest
    class << self
      def build
        array_request = Com::Android::Volley::Toolbox::JsonArrayRequest.new
      end
    end
  end
end
