module Admin
  class CommentsHelper
    def unread_comments
      Comment.limit(5).order(created_at: :desc)
    end
  end
end
