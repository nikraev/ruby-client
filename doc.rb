require 'rubygems'
require 'json'
require_relative 'mongo.rb'

class Document
  
  def initialize(message)
    @message = message
  end
    
  def createDocument(doc)
    result = doc.to_json
    $LOG.debug("Change format message to json: #{doc}")
    result
   end
  
  def processingMessage
    data = self.parceDocument()
    
  end
  
  def saveMessage()
    database = MongoData.new
    database.saveQueue(@message)
  end 
 
  
  def parceDocument()
    message = JSON.parse(@message)
    message 
  end 
  
end
