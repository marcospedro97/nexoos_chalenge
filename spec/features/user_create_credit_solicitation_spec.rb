require 'rails_helper'

describe 'user create credit solicitation' do
  scenario 'successfully' do
    # ARRANGE
    user = create(:user)
    applicant = create(:applicant, user: user)
    credit_solicitation = { value: '100000,00', plots: '12' }
    login_as user, scope: :user
    # ACT
    visit root_path
    click_on 'Suas empresas'
    click_on applicant.social_name
    click_on 'Nova solicitação de crédito'
    fill_in 'Valor', with: credit_solicitation[:value]
    fill_in 'Número de parcelas', with: credit_solicitation[:plots]
    click_on 'Registrar'
    # ASSERT
    expect(page).to have_content(13.months.from_now.strftime('%d/%m/%y'))
    expect(page).to have_content(1.month.from_now.strftime('%d/%m/%y'))
    expect(page).to have_content(applicant.social_name)
    expect(page).to have_content(applicant.cnpj)
    expect(page).to have_content('R$ 100.000,00')
    expect(page).to have_content('R$ 110.015,99')
    expect(page).to have_content('R$ 9.168,00')
  end

  scenario 'should validate fields' do
    # ARRANGE
    user = create(:user)
    applicant = create(:applicant, user: user)
    login_as user, scope: :user
    # ACT
    visit new_applicant_credit_solicitation_path(applicant)
    click_on 'Registrar'
    # ASSERT
    expect(page).to have_content('Valor não pode ficar em branco')
    expect(page).to have_content('Número de parcelas não pode ficar em branco')
  end
end
