require 'spec_helper'

describe OrganizationUser do

  describe '#only_admin?' do

    it 'is false when the contributor is not an admin' do
      contributor = create(:organization_user, admin: false)

      expect(contributor.only_admin?).to be_false
    end

    it 'is false when the contributor is not the only admin' do
      admin_contributor = create(:organization_user, admin: true)
      other_admin_contributor = create(:organization_user, {
        organization: admin_contributor.organization,
        admin: true
      })

      expect(admin_contributor.only_admin?).to be_false
    end

    it 'is true when the contributor is the only admin' do
      admin_contributor = create(:organization_user, admin: true)
      other_contributor = create(:organization_user, {
        organization: admin_contributor.organization,
        admin: false
      })

      expect(admin_contributor.only_admin?).to be_true
    end

  end

end
