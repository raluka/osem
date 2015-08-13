module Admin
  class CommentsController < Admin::BaseController
    load_and_authorize_resource

    def index
      @comments = Comment.all.order(created_at: :desc)
    end

    def unread_comments
      @unread_comments = Comment.where(created_at: (current_user.last_sign_in_at..Time.now)).order(:commentable_id, created_at: :desc)
    end

    def posted_comments
      @posted_comments = Comment.where(user_id: current_user.id).order(created_at: :desc)
    end
  end
end
