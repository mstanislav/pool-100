class Player < NSManagedObject
  def self.entity
    @entity ||= begin
      entity = NSEntityDescription.alloc.init
      entity.name = 'Player'
      entity.managedObjectClassName = 'Player'
      entity.properties =
        { 'creation_date' => NSDateAttributeType,
          'name'          => NSStringAttributeType,
          'score'         => NSInteger16AttributeType }.each.map do |name, type|
            property = NSAttributeDescription.alloc.init
            property.name = name
            property.attributeType = type
            property.optional = false
            property
          end
      entity
    end
  end
end
