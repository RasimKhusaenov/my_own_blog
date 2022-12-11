module Users
  class CommentsController < Users::BaseController
    expose :article
    expose :comment, parent: :article

    def create
      if create_comment.success?
        respond_with comment, location: article
      else
        redirect_to article_path(article), alert: create_comment.error
      end
    end

    def update
      update_comment

      respond_with comment.article do |format|
        if update_comment.success?
          format.turbo_stream { render turbo_stream: turbo_stream.update(comment) }
        end
      end
    end

    private

    def authorize_resource!
      authorize! comment
    end

    def comment_params
      params.require(:comment).permit(:content).merge(user: current_user)
    end

    def create_comment
      @create_comment ||= CreateComment.call(comment: comment)
    end

    def update_comment
      @update_comment ||= Comments::Save.call(comment: comment, comment_params: comment_params)
    end
  end
end
