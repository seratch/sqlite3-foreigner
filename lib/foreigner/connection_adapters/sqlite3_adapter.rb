module ActiveRecord
  class Base
    class << self
      def sqlite3_connection_with_foreign_key(config)
        sqlite3_connection_without_foreign_key(config).tap do |db|
          db.execute("pragma foreign_keys = on")
        end
      end
      alias_method_chain :sqlite3_connection, :foreign_key
    end
  end
end

module Foreigner
  module ConnectionAdapters
    module SQLite3Adapter
      include Foreigner::ConnectionAdapters::Sql2003

      def add_foreign_key(from_table, to_table, options = {})

        fk_column_name = options[:column] || foreign_key_column(to_table)
        pk_column_name = options[:primary_key] || 'id'

        meta_results = exec_query("select sql from sqlite_master where name = $1", nil, [[nil, from_table]])
        if meta_results.nil? || meta_results.rows.size == 0 
          raise "  [sqlite3-foreigner] error: '#{from_table}' is not found!\n\n"
        end
        create_table = meta_results[0]['sql']

        count = exec_query("select count(1) c from #{from_table}")[0]['c'].to_i
        if count > 0 
          puts "\n *** [sqlite3-foreigner]: Skipped non empty table (table: #{from_table}) ***\n\n"
          return
        end

        execute("drop table #{from_table}")

        re_create_table = create_table.gsub(/("#{fk_column_name}"\s+[^,\)]+)([,\)])/, "\\1 references #{to_table}(#{pk_column_name})\\2")
        execute(re_create_table)
      end

      def remove_foreign_key(table, options)
        column = options[:name].gsub(/^#{table.to_s.singularize}_/, '').gsub(/_foreign_key$/, '')
        ActiveRecord::Base.connection.remove_column(table, column)
      end

      private

      def foreign_key_column(to_table)
        "#{to_table.to_s.singularize}_id"
      end

    end
  end
end

Foreigner::Adapter.safe_include :SQLite3Adapter, Foreigner::ConnectionAdapters::SQLite3Adapter

