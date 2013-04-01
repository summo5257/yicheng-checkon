module Mongoid
  module StateMachine
    extend ActiveSupport::Concern

    included do
      state_machine initial: :checking do
        event :register do
          transition [:checking] => :registered
        end

        event :submit do
          transition [:registered] => :submitted
        end

        event :apply do |params|
          transition [:submitted] => :applying 
        end

        event :approval do |params|
          transition [:applying] => :submitted
        end
      end
    end
  end
end
