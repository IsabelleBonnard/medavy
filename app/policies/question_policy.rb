class QuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def quizz?
      return true
    end
  end
end
