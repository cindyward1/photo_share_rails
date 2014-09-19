require "spec_helper"

describe User do
  it { should have_many :photos }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should allow_value("email@addresse.foo").for(:email) }
  it { should_not allow_value("foo").for(:email) }
  it { should ensure_length_of(:email).is_at_most(50) }
end
