class CommentObserver < ActiveRecord::Observer

  def after_create(comment)
    puts "We will nofity the author in Chapter 9"
  end
end
