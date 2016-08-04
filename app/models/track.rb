# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  album_id   :integer          not null
#  ord        :integer          not null
#  bonus      :boolean          default(FALSE), not null
#  lyrics     :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord

  belongs_to :album

end
