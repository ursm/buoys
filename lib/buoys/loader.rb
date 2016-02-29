module Buoys
  class Loader
    class << self
      #
      # buoy :account do
      #   link 'Account', account_path
      # end
      #
      # buoy :account_edit do |account|
      #   link 'Account Edit', edit_account_path(account)
      #   pre_buoy :account
      # end
      def buoy(key, &block)
        buoys[key] = block
      end

      def buoys
        @buoys ||= {}
      end

      def load_buoys_files
        buoys.clear

        buoy_files.each do |file|
          instance_eval open(file).read, file
        end
      end

      def buoy_files
        Dir[*Buoys.buoy_file_paths]
      end
    end
  end
end
