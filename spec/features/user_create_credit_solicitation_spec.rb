require 'rails_helper'

describe 'user create credit solicitation' do
  scenario 'successfully' do
    # ARRANGE
    create(:plot_tax, plot: 12, tax: 0.015)
    user = create(:user)
    applicant = create(:applicant, user: user)
    credit_solicitation = { value: '100000,00', plots: '12' }
    login_as user, scope: :user
    # ACT
    visit root_path
    last_navbar = all('nav').last
    within(last_navbar) do
      click_on 'Minhas Empresas'
    end
    click_on 'Minhas Empresas'
    click_on applicant.social_name
    click_on 'Novo Empréstimo'
    fill_in 'Valor', with: credit_solicitation[:value]
    select '12', from: 'Número de parcelas'
    click_on 'Registrar'
    # ASSERT
    expect(page).to have_content(12.months.from_now.strftime('%d/%m/%Y'))
    expect(page).to have_content(1.month.from_now.strftime('%d/%m/%Y'))
    expect(page).to have_content(applicant.social_name)
    expect(page).to have_content('R$ 100.000,00')
    expect(page).to have_content('R$ 110.015,99')
    expect(page).to have_content('R$ 9.168,00')
  end

  scenario "can't have open credit" do
    plot_tax = create(:plot_tax, plot: 12, tax: 0.015)
    user = create(:user)
    applicant = create(:applicant, user: user)
    create(:credit_solicitation, plot_tax: plot_tax, applicant: applicant)
    credit_solicitation = { value: '100000,00', plots: '12' }
    login_as user, scope: :user
    # ACT
    visit root_path
    last_navbar = all('nav').last
    within(last_navbar) do
      click_on 'Minhas Empresas'
    end
    click_on applicant.social_name
    click_on 'Novo Empréstimo'
    fill_in 'Valor', with: credit_solicitation[:value]
    select '12', from: 'Número de parcelas'
    click_on 'Registrar'
    # ASSERT
    expect(page).to have_content('A Empresa já tem empréstimos abertos')
  end

  scenario 'should validate fields' do
    # ARRANGE
    create(:plot_tax, plot: 12, tax: 0.015)
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
