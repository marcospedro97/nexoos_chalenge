require 'rails_helper'

describe 'user view applicant' do
  it 'successfully' do
    # ARRANGE
    user = create(:user)
    applicant = create(:applicant, user: user)
    login_as user, scope: :user
    # ACT
    visit root_path
    last_navbar = all('nav').last
    within(last_navbar) do
      click_on 'Minhas Empresas'
    end
    click_on applicant.social_name
    # ASSERT
    expect(page).to have_content(applicant.social_name)
    expect(page).to have_content(applicant.cnpj)
  end

  it 'should not allow other users to view' do
    # ARRANGE
    user = create(:user)
    applicant = create(:applicant)
    login_as user, scope: :user
    # ACT
    visit applicant_path(applicant.id)
    # ASSERT
    expect(page).not_to have_content(applicant.social_name)
    expect(page).not_to have_content(applicant.cnpj)
    expect(page).to have_content('Recurso não encontrado')
  end
end
