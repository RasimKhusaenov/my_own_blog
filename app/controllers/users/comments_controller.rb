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
      respond_with update_comment.comment, location: article
    end

    def destroy
      respond_with destroy_comment.comment do |format|
        format.turbo_stream
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

    def destroy_comment
      @destroy_comment ||= Comments::Destroy.call(comment: comment)
    end
  end
end
