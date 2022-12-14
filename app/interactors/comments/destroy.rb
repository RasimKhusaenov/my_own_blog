module Comments
  class Destroy
    include Interactor

    delegate :comment, to: :context

    def call
      raise_error unless comment.destroy
    end

    private

    def raise_error
      context.fail!
    end
  end
end
