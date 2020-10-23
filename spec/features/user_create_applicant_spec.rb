require 'rails_helper'

describe 'User create applicant' do
  scenario 'successfully' do
    # ARRANGE
    user = create(:user)
    applicant = { social_name: 'Uma empresa legal',
                  cnpj: '57222068000132', phone: { number: '11967824553' },
                  address: { street: 'Rua legal', number: '321',
                             zip_code: '12345678' } }
    login_as user, scope: :user
    # ACT
    visit root_path
    click_on 'Registre sua empresa'
    fill_in 'Nome Social', with: applicant[:social_name]
    fill_in 'CNPJ', with: applicant[:cnpj]
    fill_in 'Rua', with: applicant.dig(:address, :street)
    fill_in 'Número', with: applicant.dig(:address, :number)
    fill_in 'Complemento', with: applicant.dig(:address, :complement)
    fill_in 'CEP', with: applicant.dig(:address, :zip_code)
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

  scenario 'failed' do
    # ARRANGE
    user = create(:user)
    applicant = { social_name: 'Uma empresa legal',
                  cnpj: '57222068000132',
                  address: { street: 'Rua legal' } }
    login_as user, scope: :user
    # ACT
    visit new_applicant_path
    fill_in 'Nome Social', with: applicant[:social_name]
    fill_in 'Rua', with: applicant.dig(:address, :street)
    click_button 'Registrar'
    # ASSERT
    expect(page).to have_content('Número de telefone não pode ficar em branco')
    expect(page).to have_content('Número do endereço não pode ficar em branco')
    expect(page).to have_content('CNPJ não pode ficar em branco')
  end

  scenario 'should be abble to add more phones and addresses', js: true do
    # ARRANGE
    user = create(:user)
    applicant = { social_name: 'Uma empresa legal', cnpj: '57222068000132' }
    phones = [{ number: '11967824553' }, { number: '1267824558' }]
    addresses = [{ street: 'Rua legal', number: '123', zip_code: '12345678' },
                 { street: 'Av legal', number: '321', zip_code: '12345678' }]
    login_as user, scope: :user
    # ACT
    visit new_applicant_path
    fill_in 'Nome Social', with: applicant[:social_name]
    fill_in 'CNPJ', with: applicant[:cnpj]
    fill_in 'Telefone', with: phones.first[:number]
    click_on 'Adcionar telefone'
    last_phone_field = all('#phones .nested-fields').last
    within(last_phone_field) do
      fill_in 'Telefone', with: phones.last[:number]
    end
    fill_in 'Rua', with: addresses.first[:street]
    fill_in 'Número', with: addresses.first[:number]
    fill_in 'CEP', with: addresses.first[:zip_code]
    click_on 'Adcionar endereço'
    last_address_field = all('#addresses .nested-fields').last
    within(last_address_field) do
      fill_in 'Rua', with: addresses.last[:street]
      fill_in 'Número', with: addresses.last[:number]
      fill_in 'CEP', with: addresses.last[:zip_code]
    end
    click_on 'Registrar'
    # ASSERT
    expect(page).to have_content(phones.first[:number])
    expect(page).to have_content(addresses.first[:street])
    expect(page).to have_content(phones.last[:number])
    expect(page).to have_content(addresses.last[:street])
  end
end
