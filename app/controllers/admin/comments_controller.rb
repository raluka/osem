module Admin
  class CommentsController < Admin::BaseController
    load_and_authorize_resource

    def index
      @comments = Comment.all
    end
  end
end
