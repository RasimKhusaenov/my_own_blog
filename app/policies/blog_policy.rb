# frozen_string_literal: true

class BlogPolicy < ApplicationPolicy
  class Scope < Scope
    def index?
      true
    end

    def show?
      true
    end

    def resolve
      scope.all
    end
  end
end
