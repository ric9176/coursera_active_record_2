class Profile < ActiveRecord::Base
  belongs_to :user
  validates :gender, inclusion: { in: %w(male female), message: '%{value} is not a vaild gender' }
  validate :names_not_empty
  validate :not_a_boy_named_sue

  def names_not_empty
    if first_name.nil? && last_name.nil?
      errors.add(:first_name, 'Please enter either your first or last name or both')
      errors.add(:last_name, 'Please enter either your first or last name or both')
    end
  end

  def not_a_boy_named_sue
    if gender == 'male' && first_name == 'Sue'
      errors.add(:gender, 'wrong gender')
    end
  end

  def self.get_all_profiles(min_year, max_year)
    Profile.where(birth_year: min_year..max_year).order('birth_year asc')
  end

end
