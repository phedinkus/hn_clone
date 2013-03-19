require 'spec_helper'

describe Comment do
  it { should belong_to :post }
  it { should belong_to :user }

  it { should validate_presence_of :user_id }
  it { should validate_presence_of :post }
  it { should validate_presence_of :content }
end
