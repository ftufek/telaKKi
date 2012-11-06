describe 'home page' do
  it 'contains the navbar' do
    visit '/'
    page.should have_selector('.caret')
  end
end
