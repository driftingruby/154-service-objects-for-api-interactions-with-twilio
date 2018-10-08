module Services
  module Common
    class Errors < Hash
      def add(key, value, _opts = {})
        self[key] ||= []
        self[key] << value
        self[key].uniq!
      end

      def add_multiple_errors(errors_hash)
        errors_hash.each do |key, values|
          errors_hash[key].each { |value| add key, value }
        end
      end

      def each
        each_key do |field|
          self[field].each { |message| yield field, message }
        end
      end
    end
  end
end