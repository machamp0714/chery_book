require 'sqlite3'

class ActiveRecordReplica
  db = SQLite3::Database.new "sample.db"

  def initialize(args)
    create_attr_method(args)
  end

  def save
    
  end
  
  private

    def create_method(name, &block)
      self.class.send(:define_method, name, &block)
    end

    def create_attr_method(args)
      args.each do |key, value|
        create_method(key) { self.instance_variable_get("@" + key.to_s) }
        self.instance_variable_set("@" + key.to_s, value) 
        create_method("#{key}=".to_sym) {  |value| self.instance_variable_set("@" + key.to_s, value) }
      end
    end
end