RSpec.desribe ArrayIUtils, '#flatten' do

  subject { described_class.flatten(nested_array) }

  context 'when input is a nested array of integers' do
    let(:nested_array) { [1, 2, [3, 4, [5, 6, [7], 666], 11], 8, 9] }
    it { is_expected.to eq [1, 2, 3, 4, 5, 6, 7, 666, 11, 8, 9] }
  end

  context 'when input contains non integer value' do
    let(:nested_array) { [2, [1, 2], { hash: 'value' }, 3] }
    it { expect { subject }.to raise_error ArgumentError }
  end

  context 'when input is nil' do
    let(:nested_array) { nil }
    it { is_expected.to eq [] }
  end

  context 'when input is empty' do
    let(:nested_array) { [] }
    it { is_expected.to eq [] }
  end
end