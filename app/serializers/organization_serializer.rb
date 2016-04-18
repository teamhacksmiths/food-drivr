class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :addresses

  def addresses
    addrs = []
    addresses = object.organization_addresses
    if addresses
      addresses.each do |a|
        addr = {}
        addr[:street_address] = a[:street_address]
        addr[:street_address_two] = a[:street_address_two]
        addr[:city] = a[:city]
        addr[:state] = a[:state]
        addr[:city] = a[:city]
        addr[:zip] = a[:zip]
        addr[:default] = a[:default]
        addrs << addr
      end
      addrs
    end
  end
end
