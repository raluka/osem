module Admin
  module CommentsHelper
    def unread_comments_limited
      Comment.limit(5).order(created_at: :desc)
    end
  end
end
