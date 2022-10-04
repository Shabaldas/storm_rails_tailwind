RSpec.describe Order, type: :model do
  describe 'association' do
    it { is_expected.to have_one(:cart).dependent(:destroy) }
  end
end
