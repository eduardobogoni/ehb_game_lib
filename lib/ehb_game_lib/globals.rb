module EhbGameLib
  # No-global variables bridge to Chingu global variables.
  class Globals
    class << self
      def window
        $window
      end
    end
  end
end
