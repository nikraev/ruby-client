require 'rubygems'
require 'mongo'

class MongoData
  def initialize()
    @host = '127.0.0.1'
    @port = 27000
    @database = 'messages'
    @collection = 'clients'    
  end

    def saveQueue(data)
    collect = self.connectApp()
    collect.isert(data)
  end
  
protected 
    def conectApp()
      mongo_client = MongoClient.new(@host, @port)
      db = mongo_client.db(@database)
      collect = db.collection(@collection)
      return collect
    end
    
end