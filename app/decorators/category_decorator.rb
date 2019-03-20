class CategoryDecorator < Draper::Decorator
  delegate_all

  def check_for_category_hirearchy
    if self.ancestry == nil
      :first_category
    elsif !self.ancestry.match(/\//)
      :second_category
    else
      :third_category
    end
  end
end
