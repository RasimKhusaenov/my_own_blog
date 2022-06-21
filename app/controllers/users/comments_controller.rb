module Users
  class CommentsController < Users::BaseController
    expose :comment

    def create
      self.comment = create_comment.comment

      if create_comment.success?
        respond_with comment, location: comment.article
      else
        redirect_to article_path(comment.article), alert: create_comment.error
      end
    end

    private

    def authorize_resource!
      authorize! comment
    end

    def comment_params
      params.require(:comment).permit(:content).merge(
        {
          user: current_user,
          article_id: params.require(:article_id)
        }
      )
    end

    def create_comment
      @create_comment ||= CreateComment.call(comment_params: comment_params)
    end
  end
end