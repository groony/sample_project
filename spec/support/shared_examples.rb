RSpec.shared_examples 'success service' do |_parameter|
  it do
    service.execute!
    expect(service).to be_success
  end
end

RSpec.shared_examples 'fail service' do |_parameter|
  it do
    service.execute!
    expect(service).to be_fail
  end
end

RSpec.shared_examples 'service raise not_found' do |_parameter|
  it do
    expect { service.execute! }.to raise_error(ActiveRecord::RecordNotFound)
  end
end
