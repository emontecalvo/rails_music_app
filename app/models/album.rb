# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  band_id    :integer
#  year       :integer          not null
#  live       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord

  belongs_to :band

  has_many :tracks

end
