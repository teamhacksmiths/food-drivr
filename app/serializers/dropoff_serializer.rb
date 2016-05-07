class DropoffSerializer < ActiveModel::Serializer
  attributes :estimated, :actual, :latitude, :longitude, :street_address, :street_address_two, :city, :state, :zip, :status, :status_id
  def status_id
    object.dropoffstatus.id
  end
  def status
    { :id => object.status.id, :description => object.status.name }
  end
end
