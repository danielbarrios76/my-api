module Statable
    extend ActiveSupport::Concern
  
    included do
        validates :state, inclusion: { in: proc { states } }, presence: true
    end
  
    module ClassMethods
        def markable_as(*states)
            @states = states.map(&:to_s)
            @states.each do |s|
                define_method("#{s}?") { state == s.to_s }
                define_method("mark_as_#{s}") { update_attribute(:state, s.to_s) }
            end
        end
  
        def states
            @states
        end
    end

end