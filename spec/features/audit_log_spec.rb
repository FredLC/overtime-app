require 'rails_helper'

describe 'AuditLog feature' do

	describe 'index' do
		before do
			admin_user = FactoryBot.create(:admin_user)
      		login_as(admin_user, :scope => :user)
      		FactoryBot.create(:audit_log)
		end

		it 'can be reached successfully' do
			visit audit_logs_path
			expect(page.status_code).to eq(200)
		end

		it 'renders audit log content' do
			visit audit_logs_path
			expect(page).to have_content(/MAMBRE, JONATHAN/)
		end

		xit 'cannot be accessed by non admin users' do
		end
	end
end