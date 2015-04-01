require 'rubygems'
require 'json'

class Document
    
def createDocument(message)
    doc = message.to_json
    $LOG.debug("Change format message to json: #{doc}")
    doc
   end
  
  def parceDocument(doc)
    message = JSON.parse(doc)
    message 
  end 
  
end
