require "spec_helper"

describe User do
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should ensure_length_of(:email).is_at_most(50) }
end
