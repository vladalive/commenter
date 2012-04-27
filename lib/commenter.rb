# Dependencies
require File.join File.dirname(__FILE__), "commenter", "active_record", "commentable", "class_methods.rb"
require File.join File.dirname(__FILE__), "commenter", "active_record", "comment", "class_methods.rb"
require File.join File.dirname(__FILE__), "commenter", "active_record", "comment", "instance_methods.rb"

# Rails Enhancements
if defined? Rails
  # Model
  if defined? ActiveRecord
    ActiveRecord::Base.send :include, Commenter::ActiveRecord::Commentable
    ActiveRecord::Base.send :include, Commenter::ActiveRecord::Comment
  end
end