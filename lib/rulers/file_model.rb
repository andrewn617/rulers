require "multi_json"
module Rulers
  module Model
    class FileModel
      def self.find(id)
        begin
          FileModel.new_from_file("db/quotes/#{id}.json") rescue return nil
        end
      end

      def self.all
        files = Dir["db/quotes/*.json"]
        files.map { |f| FileModel.new_from_file f }
      end

      def self.create(attrs)
        new_record = new(data: attrs)

        new_record.save
      end

      def self.new_from_file(filename)
        filename = filename # If filename is "dir/37.json", @id is 37
        basename = File.split(filename)[-1]
        id = File.basename(basename, ".json").to_i
        obj = File.read(filename)
        hash = MultiJson.load(obj)
        new(id: id, data: hash)
      end

      def initialize(data:, id: nil)
        @data = data
        @id = id
      end

      def [](name)
        @data[name.to_s]
      end

      def []=(name, value)
        @data[name.to_s] = value
      end

      def update(attrs)
        attrs.transform_keys!(&:to_s)
        @data["submitter"] = attrs["submitter"] if attrs["submitter"]
        @data["quote"] = attrs["quote"] if attrs["quote"]
        @data["attribution"] = attrs["attribution"] if attrs["attribution"]

        save
      end

      def save
        set_id if new_record?

        File.open("db/quotes/#{@id}.json", "w") do |f|
          f.write <<~TEMPLATE
            {"submitter": "#{@data["submitter"]}",  "quote": "#{@data["quote"]}",  "attribution": "#{@data["attribution"]}"}
          TEMPLATE
        end

        self
      end

      private

      def set_id
        files = Dir["db/quotes/*.json"]
        names = files.map { |f| File.split(f)[-1] }
        highest = names.map(&:to_i).max
        @id = highest + 1
      end

      def new_record?
        @id
      end

      def file_name
        "db/quotes/#{@id}.json"
      end
    end
  end
end