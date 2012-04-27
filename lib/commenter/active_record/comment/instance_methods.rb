module Commenter
  module ActiveRecord
    module Comment
      module InstanceMethods
    	  # Before saving, store the comment label as as reply of the commentable label. This is especially useful
    	  # when representing context origin (i.e. a syndicated comment feed).
    	  def auto_label
    		  # Set defaults and custom options (if any).
    			options = self.class.commenter_options

    			# Default the comment label to the commentable label.
    	    if self.send(options[:comment_label]).blank? && commentable && commentable.respond_to?(options[:commentable_label])
    				self.instance_eval "self.#{options[:comment_label]} = 'RE: ' + commentable.#{options[:commentable_label]}"
    			end
    	  end
      end
    end
  end
end
