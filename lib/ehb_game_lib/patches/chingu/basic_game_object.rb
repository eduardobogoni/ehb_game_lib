# frozen_string_literal: true

module EhbGameLib
  module Patches
    module Chingu
      module BasicGameObject
        def destroy
          super
          @alive = false
        end

        def alive?
          @alive.nil? ? true : false
        end
      end
    end
  end
end

unless ::Chingu::BasicGameObject.included_modules.include?(
  ::EhbGameLib::Patches::Chingu::BasicGameObject
)
  ::Chingu::BasicGameObject.prepend(::EhbGameLib::Patches::Chingu::BasicGameObject)
end
