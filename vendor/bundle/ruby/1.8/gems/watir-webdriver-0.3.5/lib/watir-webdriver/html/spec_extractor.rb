# encoding: utf-8

module Watir
  module HTML
    class SpecExtractor
      def initialize(uri)
        @uri = uri
      end

      def process
        download_and_parse
        extract_idl_parts
        extract_interface_map
        build_result
      rescue
        p errors
        raise
      end

      def errors
        @errors ||= []
      end

      #
      # returns a topoligically sorted array of WebIDL::Ast::Interface objects
      #

      def sorted_interfaces
        process if @interfaces.nil?

        sorter.sort.map { |name|
          @interfaces_by_name[name] or puts "ignoring interface: #{name}"
        }.flatten.compact
      end

      def print_hierarchy
        process if @interfaces.nil?
        sorter.print
      end

      private

      def download_and_parse
        open(@uri) { |io| @doc = Nokogiri.HTML(io) }
      end

      def extract_idl_parts
        parsed = @doc.search("//pre[@class='idl']").map {  |e| parse_idl(e.inner_text) }.compact

        @interfaces = parsed.map { |elements|
          elements.select { |e| e.kind_of? WebIDL::Ast::Interface  }
        }.flatten

        @interfaces_by_name = @interfaces.group_by { |i| i.name }
      end

      def extract_interface_map
        table = @doc.search("//h3[@id='elements-1']/following-sibling::table[1]").first
        table or raise "could not find elements-1 table"

        @interface_map = {}

        parse_table(table).each do |row|
          row['Element'].split(", ").each { |tag| @interface_map[tag] = row['Interface'] }
        end
      end

      def build_result
        # tag name => Interface instance(s)
        result = {}

        @interface_map.each do |tag, interface|
          result[tag] = @interfaces_by_name[interface] or raise "#{interface} not found in IDL"
        end

        result
      end

      def parse_table(table)
        headers = table.css("thead th").map { |e| e.inner_text.strip }

        table.css("tbody tr").map do |row|
          result = {}

          row.css("th, td").each_with_index do |node, idx|
            result[headers[idx]] = node.inner_text.strip
          end

          result
        end
      end

      def parse_idl(str)
        result = idl_parser.parse(str)

        if result
          result.build
        else
          errors << idl_parser.failure_reason
          nil
        end
      end

      def idl_parser
        @idl_parser ||= WebIDL::Parser::IDLParser.new
      end

      def sorter
        @idl_sroter ||= IDLSorter.new(@interfaces)
      end

    end # SpecExtractor
  end # HTML
end # Watir
