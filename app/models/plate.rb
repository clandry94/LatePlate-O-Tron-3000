class Plate < ActiveRecord::Base
  def new
    @post = Post.new
  end
end
