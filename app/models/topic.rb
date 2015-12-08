class Topic < ActiveRecord::Base
  has_many :votes, dependent: :destroy

  def self.upvote
    @topic = Topic.find(params[:id])
    @topic.votes.create
    redirect_to(topics_path)
  end

  def self.downvote
    @topic = Topic.find(params[:id])
    @topic.votes.last.destroy
    redirect_to(topics_path)
  end

end

