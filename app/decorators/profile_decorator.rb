class ProfileDecorator < Draper::Decorator
  delegate_all

  def full_address
    "#{object.prefecture.name} #{object.city} #{object.address} #{object.building_name}"
  end

  def full_name
    "#{object.delv_first_name} #{object.delv_last_name}"
  end
end
