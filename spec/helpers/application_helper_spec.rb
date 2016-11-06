require "rails_helper"

describe ApplicationHelper, :type => :helper do
  describe '#localize_goods' do
    [
      [1, I18n.t('goods.plural.one')],
      [21, I18n.t('goods.plural.one')],
      [121, I18n.t('goods.plural.one')],
      [111, I18n.t('goods.plural.many')],
      [114, I18n.t('goods.plural.many')],
      [0, I18n.t('goods.plural.many')],
      [5, I18n.t('goods.plural.many')],
      [11, I18n.t('goods.plural.many')],
      [20, I18n.t('goods.plural.many')],
      [120, I18n.t('goods.plural.many')],
      [2, I18n.t('goods.plural.other')],
      [22, I18n.t('goods.plural.other')],
      [123, I18n.t('goods.plural.other')]
    ].each do |test_case|
      it "returns '#{test_case[1]}' when goods count is #{test_case[0]}" do
        expect(helper.localize_goods(test_case[0])).to eq(test_case[1])
      end
    end
  end
end