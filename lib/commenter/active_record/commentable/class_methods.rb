module Commenter
  module ActiveRecord
    module Commentable
      def self.included base
        base.extend ClassMethods
      end      
      
      module ClassMethods
        # Defines behavior for an object that can be commented on.
        # ==== Options
        # These are the same as those used for the has_many method. Initial defaults
        # are shown below.
        # * +as+ - Optional. Defines the polymorphic refeference. Default: :commentable.
        # * +dependent+ - Optional. Defines relationship dependency. Default: :destroy.
        # * +order+ - Optional. Defines sorting order. Default: :created_at
        def is_commentable options = {}
          # Default Options
          options.reverse_merge! as: :commentable, dependent: :destroy, order: :created_at
          
          # Associations
          has_many :comments, options
        end
      end
    end
  end
end
