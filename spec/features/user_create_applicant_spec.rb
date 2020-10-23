require 'rails_helper'

describe 'User create applicant' do
  it 'successfully' do
    # ARRANGE
    user = create(:user)
    applicant = { social_name: 'Uma empresa legal',
                  cnpj: '57222068000132', phone: { number: '11967824553' },
                  address: { street: 'Rua legal', number: '321' } }
    login_as user, scope: :user
    # ACT
    visit root_path
    click_on 'Registre sua empresa'
    fill_in 'Nome Social', with: applicant[:social_name]
    fill_in 'CNPJ', with: applicant[:cnpj]
    fill_in 'Rua', with: applicant.dig(:address, :street)
    fill_in 'Número', with: applicant.dig(:address, :number)
    fill_in 'Complemento', with: applicant.dig(:address, :complement)
    fill_in 'Telefone', with: applicant.dig(:phone, :number)
    click_button 'Registrar'
    # ASSERT
    expect(page).to have_content('Empresa cadastrada')
    expect(page).to have_content(applicant[:social_name])
    expect(page).to have_content(applicant[:cnpj])
    expect(page).to have_content(applicant.dig(:address, :street))
    expect(page).to have_content(applicant.dig(:address, :number))
    expect(page).to have_content(applicant.dig(:address, :complement))
    expect(page).to have_content(applicant.dig(:phone, :number))
  end

  it 'successfully' do
    # ARRANGE
    user = create(:user)
    applicant = { social_name: 'Uma empresa legal',
                  cnpj: '57222068000132',
                  address: { street: 'Rua legal' } }
    login_as user, scope: :user
    # ACT
    visit root_path
    click_on 'Registre sua empresa'
    fill_in 'Nome Social', with: applicant[:social_name]
    fill_in 'Rua', with: applicant.dig(:address, :street)
    click_button 'Registrar'
    # ASSERT
    expect(page).to have_content('Número de telefone não pode ficar em branco')
    expect(page).to have_content('Número do endereço não pode ficar em branco')
    expect(page).to have_content('CNPJ não pode ficar em branco')
  end
end
