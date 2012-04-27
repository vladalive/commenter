module Commenter
  module ActiveRecord
    module Comment
      def self.included base
        base.extend ClassMethods
      end      
      
      module ClassMethods
        # Defines comment behavior.
        # ==== Options
      	# * +commentable_label+ - Optional. The commentable (parent object) label method. Optional. Defaults to: label.
      	# * +comment_label+ - Optional. The comment label method. Optional. Defaults to: label.
        def is_comment options = {}
          self.send :include, InstanceMethods

          # Default Options
    			options.reverse_merge! commentable_label: "label", comment_label: "label"
          class_attribute :commenter_options
          self.commenter_options = options
          
          # Associations
    			belongs_to :commentable, polymorphic: true
    			
    			# Callbacks
    			before_save :auto_label
        end
      end
    end
  end
end
