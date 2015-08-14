module Admin
  class CommentsController < Admin::BaseController
    load_and_authorize_resource

    def index
      @comments = Comment.all.order(:commentable_id, created_at: :desc)
      @unread_comments = unread
      @posted_comments = posted
    end

    private

    def unread
       Comment.where(created_at: (current_user.last_sign_in_at..Time.now)).order(:commentable_id, created_at: :desc)
    end

    def posted
      Comment.where(user_id: current_user.id).order(:commentable_id, created_at: :desc)
    end
  end
end
