class Promotion < ActiveRecord::Base
    has_many :proms, dependent: :destroy
    has_many :cloths, :through => :proms

    before_save :falsify_all_others

    def falsify_all_others
        self.class.where('id != ? and show', self.id).update_all("show = 'false'")
    end
end
