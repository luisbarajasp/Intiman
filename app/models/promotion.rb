class Promotion < ActiveRecord::Base
    has_many :proms, dependent: :destroy
    has_many :cloths, :through => :proms

    before_save :falsify_all_others

    private

    def falsify_all_others
        self.class.where(show: true).update_all(show: false)
    end
end
