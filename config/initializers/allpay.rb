require "active_merchant/billing/integrations/action_view_helper"
ActionView::Base.send(:include, ActiveMerchant::Billing::Integrations::ActionViewHelper)

ActiveMerchant::Billing::Integrations::Allpay.setup do |allpay|
  if Rails.env.development?
    # default setting for stage test
    allpay.merchant_id = '2000132'
    allpay.hash_key    = '5294y06JbISpM5x9'
    allpay.hash_iv     = 'v77hoKGq4kWxNNIS'
  else
    # change to yours
    allpay.merchant_id = ENV["allpay_merchant_id"]
    allpay.hash_key    = ENV["allpay_hash_key"]
    allpay.hash_iv     = ENV["allpay_hash_iv"]
  end
end