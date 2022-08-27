RSpec.describe Cart, type: :model do
  describe 'association' do
    it { is_expected.to belong_to(:order).optional }
    it { is_expected.to have_many(:cart_items) }
  end
end
