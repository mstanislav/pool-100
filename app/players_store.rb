class PlayersStore
  def self.shared
    @shared ||= PlayersStore.new
  end

  def players
    @players ||= begin
      request = NSFetchRequest.alloc.init
      request.entity = NSEntityDescription.entityForName('Player', inManagedObjectContext:@context)
      request.sortDescriptors = [NSSortDescriptor.alloc.initWithKey('creation_date', ascending:false)]

      error_ptr = Pointer.new(:object)
      data = @context.executeFetchRequest(request, error:error_ptr)
      if data == nil
        raise "Error when fetching data: #{error_ptr[0].description}"
      end
      data
    end
  end

  def add_player
    yield NSEntityDescription.insertNewObjectForEntityForName('Player', inManagedObjectContext:@context)
    save
  end

  def remove_player(player)
    @context.deleteObject(player)
    save
  end

  private

  def initialize
    model = NSManagedObjectModel.alloc.init
    model.entities = [Player.entity]

    store = NSPersistentStoreCoordinator.alloc.initWithManagedObjectModel(model)
    store_url = NSURL.fileURLWithPath(File.join(NSHomeDirectory(), 'Documents', 'Pool100.sqlite'))
    error_ptr = Pointer.new(:object)
    unless store.addPersistentStoreWithType(NSSQLiteStoreType, configuration:nil, URL:store_url, options:nil, error:error_ptr)
      raise "Can't add persistent SQLite store: #{error_ptr[0].description}"
    end

    context = NSManagedObjectContext.alloc.init
    context.persistentStoreCoordinator = store
    @context = context
  end

  def save
    error_ptr = Pointer.new(:object)
    unless @context.save(error_ptr)
      raise "Error when saving the model: #{error_ptr[0].description}"
    end
    @players = nil
  end
end
