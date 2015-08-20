module Admin
  class CommentsController < Admin::BaseController
    load_and_authorize_resource

    def index
      @comments = Comment.all
      @unread_comments = unread
      @posted_comments = posted
    end

    def comments_list(event)
      Comment.find_comments_for_commentable(Event, event.id)
    end

    def unread
       Comment.where(created_at: (current_user.last_sign_in_at..Time.now))
    end

    def posted
      Comment.where(user_id: current_user.id)
    end
  end
end
